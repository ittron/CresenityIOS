//
//  Helper.swift
//


import Foundation
import UIKit

class Helper : NSObject {
    
    override init () {
        // uncomment this line if your class has been inherited from any other class
        //super.init()
    }
    
    
    
    func getMemberId() -> String? {
        var memberId : String = ""
        
        memberId = UserDefaults.standard.string(forKey: "memberId")!
        return memberId
    }
    
    func setMemberId(memberId : String) {
        UserDefaults.standard.set(memberId, forKey: "memberId")
    }
    
    func deleteMemberId(){
        UserDefaults.standard.removeObject(forKey: "memberId")
    }
    
    func getSessionId() -> String? {
        let sessionId = UserDefaults.standard.string(forKey: "session_id")
        return sessionId
    }
    
    func setSessionID(sessionID : String){
        UserDefaults.standard.set(sessionID, forKey: "session_id")
    }
    
    func setPoster(posterId : String){
        UserDefaults.standard.set(posterId, forKey: "posterImageUrl")
    }
    
    func getPosterId() -> String? {
        let posterid = UserDefaults.standard.string(forKey: "posterImageUrl")
        return posterid
    }
    
    
    func deleteUserData() {
        UserDefaults.standard.removeObject(forKey: "member")
    }
    
    func getMemberData() -> Dictionary<String,String> {
        var memberData : Dictionary<String,String> = Dictionary<String,String>()
        if(UserDefaults.standard.dictionary(forKey: "member") != nil) {
            memberData = UserDefaults.standard.dictionary(forKey: "member") as! Dictionary<String,String>
        }
        return memberData
    }
    
    func convertPriceToNoCurrency(price_text:String) -> String {
        var price : String = ""
        
        let formatter = NumberFormatter()
        //        formatter.locale = Locale(identifier: "id_ID")
        //        formatter.numberStyle = .currency
        formatter.currencyDecimalSeparator = "###,###,###.##"
        //        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        
        price = formatter.string(from: NSNumber.init(value: Double(price_text)!))!
        
        return price
    }
    
    func getDeviceData() -> Dictionary<String,String> {
        var deviceData : Dictionary<String,String> = Dictionary<String,String>()
        if(UserDefaults.standard.dictionary(forKey: "device") != nil) {
            deviceData = UserDefaults.standard.dictionary(forKey: "device") as! Dictionary<String,String>
        }
        return deviceData
    }
    
    func getFcmToken() -> String {
        let fcmToken = UserDefaults.standard.string(forKey: "fcmToken")
        return fcmToken!
    }
    
    func setCloudMessagingId(cloudMessagingId : String) {
        UserDefaults.standard.string(forKey: "cloudMessagingId")
    }
    
    func convertPriceToCurrency(price_text:String) -> String {
        var price : String = ""
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.numberStyle = .currency
        
        price = formatter.string(from: NSNumber.init(value: Double(price_text)!))!
        
        return price
    }
    
    func formatNumbering(number_text:String) -> String {
        
        var number : String = ""
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let number_int = Int(number_text)
        number = formatter.string(from: NSNumber(value:(number_int)!))!
        
        return number
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "database", ofType: ".sqlite")
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let fullDestPath = URL(fileURLWithPath: destPath).appendingPathComponent("database.sqlite")
        if fileManager.fileExists(atPath: fullDestPath.path){
            print("Database file is exist")
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPath.path)
            }catch{
                print("\n",error)
            }
        }
    }
    func uicolorFromHex(_ rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    
    func heightForViewAttributedString(text: NSMutableAttributedString, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.attributedText = text
        label.sizeToFit()
        
        return label.frame.height
    }
    
    func getAppInfo() -> Dictionary<String,String> {
        let appInfoData = UserDefaults.standard.dictionary(forKey: "appInfo") as! Dictionary<String,String>
        return appInfoData
    }
    
    
    func isValidPhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    func isValidEmail(value:String) -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: value)
        return result
    }
    
    func showAlert(view: UIViewController, message: String) {
        let alert = UIAlertController(title: Setting.app_name, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        
        view.present(alert, animated: true, completion: nil)
    }
    
    func randomString(_ length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    func formatDate(date: String) -> String {
        var dateFormatted : String = ""
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM yyyy HH:mm:ss"
        
        let dateUnformatted = dateFormatterGet.date(from: date)
        dateFormatted = dateFormatterPrint.string(from: dateUnformatted!)
        
        return dateFormatted
    }
    
    func formatToDateOnly(date: String) -> String {
        var dateFormatted : String = ""
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM yyyy"
        
        let dateUnformatted = dateFormatterGet.date(from: date)
        dateFormatted = dateFormatterPrint.string(from: dateUnformatted!)
        
        return dateFormatted
    }
    
    func formatToTimeOnly(date: String) -> String {
        var dateFormatted : String = ""
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "HH:mm:ss"
        
        let dateUnformatted = dateFormatterGet.date(from: date)
        dateFormatted = dateFormatterPrint.string(from: dateUnformatted!)
        
        return dateFormatted
    }
    
    
    func stringToBytes(_ string: String) -> [UInt8]? {
        let length = string.count
        if length & 1 != 0 {
            return nil
        }
        var bytes = [UInt8]()
        bytes.reserveCapacity(length/2)
        var index = string.startIndex
        for _ in 0..<length/2 {
            let nextIndex = string.index(index, offsetBy: 2)
            if let b = UInt8(string[index..<nextIndex], radix: 16) {
                bytes.append(b)
            } else {
                return nil
            }
            index = nextIndex
        }
        return bytes
    }
    
}
