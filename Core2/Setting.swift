//
//  Setting.swift
//  membership
//
//  Created by YBC on 30/05/18.
//  Copyright © 2018 YBC. All rights reserved.
//

import Foundation
import UIKit

class Setting : NSObject {
    static let app_name = "Tribelio"
//    static let url_api_server = "https://mvp.tribelio.com/api/member/" // kondisi live
//    static let url_server = "https://mvp.tribelio.com/" // kondisi live

        static let url_api_server = "http://tribelio.app.ittron.co.id/api/member/"
    static let url_server = "http://tribelio.app.ittron.co.id/"
    static let loading_size_indicator = CGSize(width: 100, height:100)
    static let auth_id = "a678803588713b45ae8baf50adefb813"
    static let timeout_post : Double = 30.0
    static let is_production_environment : Bool = false
    
    
}
