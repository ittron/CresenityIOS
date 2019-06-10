//
//  PostTask.swift
//  InstaPorta-iOS
//
//  Created by YBC on 30/07/18.
//  Copyright © 2018 instaporta. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import Toast_Swift

class PostTask : NSObject {
    
    var requestParameters : Dictionary<String,String> = Dictionary<String,String>()
    var parameters : Parameters?
    var action : String?
    var helper : Helper = Helper()
    var viewController : CCViewController?
    var postTaskListener : PostTaskListener?
    var animasiOn : Bool?
    
    init(viewController: CCViewController, action: String, requestParameters: Dictionary<String,String>, postTaskListener: PostTaskListener,loading : Bool) {
        super.init()
        
        self.parameters = requestParameters
        self.action = action
        self.viewController = viewController
        self.postTaskListener = postTaskListener
        self.animasiOn = loading
        self.execute()
    }
    
    
    private func execute() {
        
        print("postnya ",self.action!)
        
        if (self.animasiOn == true) {
              self.viewController!.startAnimating(Setting.loading_size_indicator, message: "Memproses Permintaan Anda", type: NVActivityIndicatorType.ballRotateChase)
        }
        
        Alamofire.request("\(Setting.url_api_server)\(self.action!)", method: .post, parameters: self.parameters, encoding:URLEncoding.httpBody).responseString { response in
            
            if(self.animasiOn == true){
                 self.viewController!.stopAnimating()
            }
           
            switch response.result {
            case .success(let value):
                
                let json = JSON.init(parseJSON: value)
                if(self.action == "MemberLogin" || self.action == "MemberGetDriverOffer" || self.action != "DriverGetCurrentTransaction" || self.action != "DriverGetRequestPickup" || self.action == "DriverOffer" || self.action == "MemberLogout"){
                    
                    var responseParameters : Dictionary<String,String> = Dictionary<String,String>()
                    
                    responseParameters["result"] = value
                    responseParameters["action"] = self.action
                    
                    self.postTaskListener!.onPostTaskResult(request: self.requestParameters, response: responseParameters)
                }else{
                    if(json["err_code"].stringValue == "0") {
                        var responseParameters : Dictionary<String,String> = Dictionary<String,String>()
                        
                        responseParameters["result"] = value
                        responseParameters["action"] = self.action
                        
                        self.postTaskListener!.onPostTaskResult(request: self.requestParameters, response: responseParameters)
                    }
                        
                    else {
                        self.helper.showAlert(view: self.viewController!, message: json["err_message"].stringValue)
                    }
                }
                
            case .failure(let error):
                
                print(error)
                
                let alert = UIAlertController(title: Setting.app_name, message: "Gagal mendapatkan respon dari server, ulangi kembali ?", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Ya", style: UIAlertAction.Style.default, handler: { action in
                    self.execute()
                }))
                
                self.viewController!.present(alert, animated: true, completion: nil)
            }
        }
    }
}
