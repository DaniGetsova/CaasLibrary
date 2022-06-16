//EPS Digital Wallet, 2021

import Foundation
import UIKit
//import SwiftyJSON
//import KeychainSwift
//import Firebase
//import FirebaseMessaging


class API {
    var TOKEN_URL = "https://digizator-identityserver-mobileapp-prod.azurewebsites.net/"
    //"https://eps-digizator-identityserver-mobile-test.azurewebsites.net/"
    
    var BASE_URL = "https://digizator-apigateway-bg-prod.azurewebsites.net/"
    //"https://eps-digizator-apigateway-bg-test.azurewebsites.net/"
    
    let clientId = "white.card.bg"
    let secret = "J8caj10BnT7a4RCdE3jUxm9Ad50hds5N"
  
    
//    /* Generate Token */
//    func generateToken(completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//
//        let headers = ["Content-Type": "application/x-www-form-urlencoded"]
//        let parameters: Parameters = [
//            "client_id": clientId,//"\(Bundle.main.bundleIdentifier ?? "")",
//            "client_secret": secret,
//            //"secret",////"\(keychain.get("password") ?? "")",
//            "grant_type": "client_credentials",
//            "scope": "PhoneAPPApiScope",
//            "app_version": "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "")"]
//
//     AF.request("\(TOKEN_URL)connect/token", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//            let status = response.response?.statusCode ?? 0
//
//            if status == 200 {
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//
//                    let tokenPayload = TokenDecoder().decode(jwtToken: json["access_token"].rawValue as! String)
//                    let appleWalletEnabled = tokenPayload["client_apple_wallet_enabled"] as! String
//                    UserDefaults.standard.setValue(appleWalletEnabled, forKey: "appleWalletEnabled")
//
//                    UserDefaults.standard.setValue("\(json["access_token"])", forKey: "token")
//                    let keychain = KeychainSwift()
//                    keychain.set("\(json["access_token"])", forKey: "token")
//
//                    completion()
//                }
//            }
//
//            else if status == 400 {
//                //self.sendLog(response: response, status: status)
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//                    let error =  "\(json["error_description"])"
//
//                    if error == "User is inactive" {
//                        NotificationCenter.default.post(name: NSNotification.Name("otherDeviceError"), object: nil)
//                        NSLog("-----Error when getting IS token, status: " + String(status) + " " + error)
//                        failure()
//                    }
//                    else if error == "User is blocked" {
//                        NotificationCenter.default.post(name: NSNotification.Name("userBlocked"), object: nil)
//                        NSLog("-----Error when getting IS token, status: \(status) - \(error)")
//                        failure()
//                    } else {
//                        NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                        NSLog("-----Error when getting IS token, status: " + String(status))
//                        failure()
//                    }
//                } else {
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Error when getting IS token, status: " + String(status))
//                    failure()
//                }
//            }
//            else {
//                //self.sendLog(response: response, status: status)
//                NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                NSLog("-----Error when getting IS token, status: " + String(status))
//                failure()
//            }
//        }
//    }
//
//    /* Generate Mea Token */
//    func generateMeaToken(completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//
//        let id = UserDefaults.standard.value(forKey:"applicationId") ?? ""
//        let keychain = KeychainSwift()
//        let headers = ["Content-Type": "application/x-www-form-urlencoded"]
//        let parameters: Parameters = [
//
//            "client_id": clientId,//"\(Bundle.main.bundleIdentifier ?? "")",
//            "client_secret": secret,
//            //"secret",// //"\(keychain.get("password") ?? "")",
//            "username": "\(id)",
//            "password": "\(keychain.get("password") ?? "")",
//            "grant_type": "password",
//            "scope": "PhoneAPPApiScope",
//            "app_version": "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "1.0")"]
//
//        AF.request("\(TOKEN_URL)connect/token", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//
//            let status = response.response?.statusCode ?? 0
//            if status == 200 {
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//
//                    let tokenPayload = TokenDecoder().decode(jwtToken: json["access_token"].rawValue as! String)
//                    let appleWalletEnabled = tokenPayload["client_apple_wallet_enabled"] as! String
//                    UserDefaults.standard.setValue(appleWalletEnabled, forKey: "appleWalletEnabled")
//
//                    UserDefaults.standard.setValue("\(json["access_token"])", forKey: "Meatoken")
//                    let keychain = KeychainSwift()
//                    keychain.set("\(json["access_token"])", forKey: "Meatoken")
//
//                    let expirationSeconds: Double = json["expires_in"].rawValue as! Double
//                    let expirationDate = Date().addingTimeInterval(expirationSeconds)
//
//                    UserDefaults.standard.set(expirationDate, forKey: "tokenExpirationDate")
//
//
//                    completion()
//                }
//        }
//            else if status == 400 {
//                //self.sendLog(response: response, status: status)
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//                    let error =  "\(json["error_description"])"
//                    let errorCode = "\(json["error_code"])"
//                    if error == "User is inactive" {
//                        NotificationCenter.default.post(name: NSNotification.Name("otherDeviceError"), object: nil)
//                        NSLog("-----Error when getting mea token, status: \(status) - \(error)")
//                        failure()
//                    }
//                    else if error == "User is blocked" {
//                        NotificationCenter.default.post(name: NSNotification.Name("userBlocked"), object: nil)
//                        NSLog("-----Error when getting mea token, status: \(status) - \(error)")
//                        failure()
//
//                    }
//                    else if error == "Invalid app version" {
//                        NotificationCenter.default.post(name: NSNotification.Name("updateVersion"), object: nil)
//                        NSLog("-----Error when getting mea token, status: \(status) - \(error)")
//                        failure()
//
//                    }
//                    else if errorCode == "124" {
//                        UserDefaults.standard.set("", forKey: "applicationId")
//                        NotificationCenter.default.post(name: NSNotification.Name("enrollAgain"), object: nil)
//                        NSLog("-----Error when getting mea token, error: " + String(error))
//                    } else {
//                        //NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                        NSLog("-----Error when getting mea token, status: " + String(status))
//                        failure()
//                    }
//
//
//            } else {
//                //NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                //NSLog("-----Error when getting mea token, status: " + String(status))
//                failure()
//            }
//        } else {
//            //self.sendLog(response: response, status: status)
//            //NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//            NSLog("-----Error when getting mea token, status: " + String(status))
//            failure()
//        }
//    }
//}
//
//    /* Register Client */
//    func registerClient(withParameters parameters: [String:String], completion: @escaping ((clientData?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "token") ?? ""
//        let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//        let data = clientData()
//
//        let clientCardNumber = parameters["clientCardNumber"]!
//        let socialSecurityNumber = parameters["socialSecurityNumber"]!
//
//        data.clientCardNumber = Int(clientCardNumber)
//        data.socialSecurityNumber = socialSecurityNumber
//
//        AF.request("\(BASE_URL)api/v1.0/ClientManager/register-client", method: .post, parameters: data, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//
//            let status = response.response?.statusCode ?? 0
//            if status == 200 {
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//
//                    UserDefaults.standard.setValue(clientCardNumber, forKey: "clientNumber")
//                    UserDefaults.standard.setValue(socialSecurityNumber, forKey: "clientId")
//
//                    let dataObject =  clientData()
//                    dataObject.maskedClientPhoneNumber = "\(json["maskedClientPhoneNumber"])"
//                    dataObject.registrationSmsNextDateUTC = "\(json["registrationSmsNextDateUTC"])"
//
//                    UserDefaults.standard.setValue("\(json["maskedClientPhoneNumber"])", forKey: "maskedClientPhoneNumber")
//                    UserDefaults.standard.setValue("\(json["registrationSmsNextDateUTC"])", forKey: "registrationSmsNextDateUTC")
//                    UserDefaults.standard.setValue("", forKey: "secretKey")
//
//                    completion(dataObject)
//                }else {
//                    NotificationCenter.default.post(name: NSNotification.Name("connectionFailed"), object: nil)
//                    failure()
//                }
//            }
//            else if status == 400 {
//                self.sendResponseAsLog(response: response, status: status)
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//                    let errorCode =  "\(json["errorCode"])"
//                    if errorCode=="531" || errorCode=="543" {
//                        NotificationCenter.default.post(name: NSNotification.Name("invalidArguments"), object: nil)
//                        failure()
//                    }
//                    else if errorCode=="1009" {
//                        NotificationCenter.default.post(name: NSNotification.Name("cardNotActive"), object: nil)
//                        failure()
//                    }
//                    else if errorCode=="1010" {
//                        NotificationCenter.default.post(name: NSNotification.Name("brandNotSupported"), object: nil)
//                        failure()
//                    } else {
//                        NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                        NSLog("-----register error, status: " + String(status))
//                        failure()
//                    }
//                } else {
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----register error, status: " + String(status))
//                    failure()
//                }
//            } else {
//                self.sendResponseAsLog(response: response, status: status)
//                NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                NSLog("-----register error, status: " + String(status))
//                failure()
//            }
//        }
//    }
//
//    /* Enroll Client */
//    func enrollClient(withParameters parameters: [String:String], completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//        let fcmToken = Messaging.messaging().fcmToken
//
//        let token = UserDefaults.standard.value(forKey: "token") ?? ""
//        let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//        let data = clientData()
//        //let id = NSUUID().uuidString
//        let id = UserDefaults.standard.value(forKey: "applicationId") ?? NSUUID().uuidString
//        let width = UIScreen.main.nativeBounds.width
//        let height = UIScreen.main.nativeBounds.height
//        let keychain = KeychainSwift()
//                let result = keychain.get("password") ?? ""
//                if result == "" {
//                    let password = String().randomString(of: 32)
//                    keychain.set(password, forKey: "password")
//                }
//
//        let clientCardNumber = parameters["clientCardNumber"]!
//        let socialSecurityNumber = parameters["socialSecurityNumber"]!
//        let applicationInstallationUUID = "\(id )"
//        let otpCode = parameters["otpCode"]!
//        let password = "\(keychain.get("password") ?? "")"
//        let phoneManufacturer = "Apple"
//        let phoneModel = UIDevice.modelName//"\(UIDevice.current.model)"
//        let phoneOS = "\(UIDevice.current.systemName)"
//        let phonePlatformVersion = "\(UIDevice.current.systemVersion)"
//        let phoneScreenResolutionPx = "\(width)x\(height)"
//        let phoneScreenResolutionDpi = "\(UIScreen.main.nativeScale*160)"
//        let appVersion = ("\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "1.0")")
//        let phoneUserLanguage = "\(Locale.current.languageCode ?? "English")"
//        let applicationId = "white.card.bg"//"\(Bundle.main.bundleIdentifier ?? "")"
//        let secretKey = String().generateSecretKey(otpCode: otpCode)
//        let pushNotificationToken = (fcmToken ?? "") //"erp8iJFGlUoUvVqZohpPdO:APA91bFhgffaSrHKwR2vXd0Bwa7jY4FbQJStmjizQt7kCj16ErMx-RderM7mTr9WR53jvWzqAXDieFAqHAcKVeVsFZMsdSo3_adJsBF0NpwIXEBsn_4zakDU5gFE-BZAC2E74GPxElMI" //
//
//        data.clientCardNumber = Int(clientCardNumber)
//        data.socialSecurityNumber = socialSecurityNumber
//        data.applicationInstallationUUID = applicationInstallationUUID
//        data.otpCode = otpCode
//        data.password = password
//        data.phoneManufacturer = phoneManufacturer
//        data.phoneModel = phoneModel
//        data.phoneOS = phoneOS
//        data.phonePlatformVersion = phonePlatformVersion
//        data.phoneScreenResolutionPx = phoneScreenResolutionPx
//        data.phoneScreenResolutionDpi = phoneScreenResolutionDpi
//        data.appVersion = Decimal(string: appVersion)
//        data.phoneUserLanguage = phoneUserLanguage
//        data.applicationId = applicationId
//        data.secretKey = secretKey
//        data.pushNotificationToken = pushNotificationToken
//
//        AF.request("\(BASE_URL)api/v1.0/ClientManager/enroll-client", method: .post, parameters: data, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//
//            let status = response.response?.statusCode ?? 0
//            if status == 200 {
//
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//                    UserDefaults.standard.setValue(id, forKey: "applicationId")
//                    UserDefaults.standard.setValue("\(json["clientFirstName"])", forKey: "clientFirstName")
//
//                    keychain.set(secretKey, forKey: "secretKey")
//                    UserDefaults.standard.setValue(secretKey, forKey: "secretKey")
//
//                    completion()
//                }
//            }
//            else if status == 400 {
//                self.sendResponseAsLog(response: response, status: status)
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    } else {
//                        NSLog("-----------Enrol request result: " + json.description)
//                    }
//                    let errorCode =  "\(json["errorCode"])"
//                    if errorCode=="1000" || errorCode=="1005"{
//                        NotificationCenter.default.post(name: NSNotification.Name("wrongCode"), object: nil)
//                        NSLog("-----Enroll request failed, status: " + String(status))
//                        failure()
//                    } else{
//                        NotificationCenter.default.post(name: NSNotification.Name("connectionFailed"), object: nil)
//                        NSLog("-----Enroll request failed, status: " + String(status))
//                        failure()
//                    }
//                }else {
//                    NotificationCenter.default.post(name: NSNotification.Name("connectionFailed"), object: nil)
//                    NSLog("-----Enroll request failed, status: " + String(status))
//                    failure()
//                }
//            }else {
//                self.sendResponseAsLog(response: response, status: status)
//                NotificationCenter.default.post(name: NSNotification.Name("connectionFailed"), object: nil)
//                NSLog("-----Enroll request failed, status: " + String(status))
//                failure()
//            }
//        }
//    }
//
//    /* MeaWallet Manager */
//    func getMeaWallet(clientCardNumber: Int, completion: @escaping ((meaWalletData?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
////        if UserDefaults.standard.value(forKey: "Meatoken") as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.getMeaWallet(clientCardNumber: clientCardNumber) { (data) in
////                    completion(data)
////                        } failure: {
////                            failure()
////                        }
////            } failure: {}
////        }
////        else{
//                let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//                //let uuid = "\(UIDevice.current.identifierForVendor?.uuidString ?? "")"
//
//                AF.request("\(BASE_URL)api/v1.0/MeaWalletManager/get-otp-and-encrypted-card-id?ClientCardNumber=\(clientCardNumber)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//
//                        let data = meaWalletData()
//                        data.totpCode = "\(json["totpCode"])"
//                        data.encryptedCardId = "\(json["encryptedCardId"])"
//                        completion(data)
//                    }else {
//                        NSLog("-----MeaWallet request failed, status: " + String(status) + response.response.debugDescription)
//                        failure()
//                    }
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NSLog("-----MeaWallet request failed, status: " + String(status) + response.response.debugDescription)
//                    failure()
//                }
//            }
//        //}
//    }
//
//    /* Get homescreen data */
//    func getHomeScreenData(clientCardNumber: Int, completion: @escaping ((cardData?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.getHomeScreenData(clientCardNumber: clientCardNumber) { (data) in
////                    completion(data)
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//            //let uuid = "\(UIDevice.current.identifierForVendor?.uuidString ?? "")"
//
//            AF.request("\(BASE_URL)api/v1.0/CardManager/card-data?ClientCardNumber=\(clientCardNumber)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                               if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        let data = cardData()
//                        data.cardHolderFirstName = "\(json["cardHolderFirstName"])"
//                        data.cardHolderLastName = "\(json["cardHolderLastName"])"
//                        data.expirationMonth = "\(json["expirationMonth"])"
//                        data.expirationYear = "\(json["expirationYear"])"
//                        data.maskedPAN = "\(json["maskedPAN"])"
//                        data.embossName = "\(json["embossName"])"
//                        data.brandId = "\(json["brandId"])"
//                        data.clientCardNumber = "\(json["clientCardNumber"])"
//                        completion(data)
//
//                    }else {
//                        failure()
//                    }
//                }
//                else if status == 400 {
//                    self.sendResponseAsLog(response: response, status: status)
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        let errorCode =  "\(json["errorCode"])"
//                        if errorCode=="1004" {
//                            NotificationCenter.default.post(name: NSNotification.Name("enterPan"), object: nil)
//                        }
//
//                        let data = cardData()
//                        completion(data)
//                    }
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----GetHomeScreenData request failed, status: " + String(status))
//                    failure()
//                }
//            }
//        //}
//    }
//
//    /* Send Pan number to API if risky client */
//    func sendPanNumber(withParameters encryptedPan: String, completion: @escaping ((meaWalletData) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//        let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//        AF.request("\(BASE_URL)api/v1.0/MeaWalletManager/get-otp-and-encrypted-card-id-and-validate-pan?EncryptedPAN=\(encryptedPan)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//
//            let status = response.response?.statusCode ?? 0
//            if status == 200 {
//
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//
//                    let data = meaWalletData()
//                    data.totpCode = "\(json["totpCode"])"
//                    data.encryptedCardId = "\(json["encryptedCardId"])"
//                    completion(data)
//                }else {
//                    failure()
//                }
//            }
//            else{
//                self.sendResponseAsLog(response: response, status: status)
//                failure()
//                NotificationCenter.default.post(name: NSNotification.Name("wrongPan"), object: nil)
//            }
//        }
//    }
//
//    /* Update risk client status */
//    func updateRiskStatus(withParameters encryptedPan: String, completion: @escaping () -> Void, failure: @escaping () -> Void) {
//
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//        let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//        let parameters = ["encryptedPAN":"\(encryptedPan)"]
//
//        AF.request("\(BASE_URL)api/v1.0/MeaWalletManager/update-customer-risk-status?encryptedPAN=\(encryptedPan)", method: .put, parameters: parameters, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//
//            let status = response.response?.statusCode ?? 0
//            if status == 200 || status == 204 {
//
//                completion()
//
//            }else {
//                self.sendResponseAsLog(response: response, status: status)
//                failure()
//            }
//        }
//    }
//
//    /* Client Update Token */
//    func updateToken(withParameters parameters: [String:String], completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//        //let token = UserDefaults.standard.value(forKey: "token") ?? ""
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//        let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//        let data = clientData()
//
//        data.pushNotificationToken = "\(parameters["pushNotificationToken"]!)"
//
//        AF.request("\(BASE_URL)api/v1.0/Client/update-push-notification-token", method: .put, parameters: data, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//
//            let status = response.response?.statusCode ?? 0
//            if status == 200 {
//                completion()
//            }else {
//                self.sendResponseAsLog(response: response, status: status)
//                failure()
//            }
//        }
//    }
//    /* get-all-not-added-cards */
//    func getAllNotAddedCards(completion: @escaping (([cardData]?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.getAllNotAddedCards { (data) in
////                    completion(data)
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//            AF.request("\(BASE_URL)api/v1.0/CardManager/get-all-not-added-cards", method: .get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                               if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        var data:[cardData] = []
//
//                        for cardItem in json {
//                            let cardTest = cardItem.1
//                            let card = cardData()
//                          card.cardHolderFirstName = "\(cardTest["cardHolderFirstName"])"
//                            card.cardHolderLastName = "\(cardTest["cardHolderLastName"])"
//                            card.expirationMonth = "\(cardTest["expirationMonth"])"
//                            card.expirationYear = "\(cardTest["expirationYear"])"
//                            card.maskedPAN = "\(cardTest["maskedPAN"])"
//                            card.embossName = "\(cardTest["embossName"])"
//                            card.brandId = "\(cardTest["brandId"])"
//                            card.clientCardNumber = "\(cardTest["clientCardNumber"])"
//
//
//                            data.append(card)
//
//                        }
//
//                        completion(data)
//
//                    }else {
//                        failure()
//                    }
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----GetAllNot AddedCards request failed, status: " + String(status))
//                    failure()
//                }
//            }
//        //}
//    }
//
//    /* Get Transactions */
//    func getTransactions(clientCardNumber: Int, skip: Int, take: Int, transactionType: Int, completion: @escaping (([transaction]?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.getTransactions(clientCardNumber: clientCardNumber,skip: skip, take: take, transactionType: transactionType){ (data) in
////                    completion(data)
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//            //let clientNumber = UserDefaults.standard.value(forKey: "clientNumber") ?? ""
//
//            let parameters: Parameters = [
//                "clientCardNumber": clientCardNumber,
//                "skip":"\(skip)",
//                "take": "\(take)",
//                "transactionType": "\(transactionType)"]
//
//            AF.request("\(BASE_URL)api/v1.0/FinanceOperations/get-transactions", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        var data:[transaction] = []
////                        let tr1 = transaction(date: "1640787817", amount: "100.00", image: "", clientCardNumber: "234543", productId: "", description: "testtesttest", cardBalance: "", responseText: "", responseCode: "", merchantCategoryCode: "6011", currencyNumericCode: "",  originalAmount: "100.00", originalCurrencyNumericCode: "", transactionType: "", merchantCountry: "", merchantCity: "", merchantName: "merchantName", amountFormattedString: "100.00лв.", originalCurrencyLetterCode: "", currencyLetterCode: "", maskedPan: "", originalAmountFormattedString: "", mccCategoryId: "")
////
////                        data.append(tr1)
//
//                        for trans in json["cardTransactions"] {
//                            let tr = trans.1
//                            let temp = transaction(date: "\(tr["transactionDateUTC"])", amount: "\(tr["amount"])", image: "\(tr["image"])", clientCardNumber: "\(tr["clientCardNumber"])", productId: "\(tr["productId"])", description: "\(tr["description"])", cardBalance: "\(tr["cardBalance"])", responseText: "\(tr["responseText"])", responseCode: "\(tr["responseCode"])", merchantCategoryCode: "\(tr["merchantCategoryCode"])", currencyNumericCode: "\(tr["currencyNumericCode"])",  originalAmount: "\(tr["originalAmount"])", originalCurrencyNumericCode: "\(tr["originalCurrencyNumericCode"])", transactionType: "\(tr["transactionType"])", merchantCountry: "\(tr["merchantCountry"])", merchantCity: "\(tr["merchantCity"])", merchantName: "\(tr["merchantName"])", amountFormattedString: "\(tr["amountFormattedString"])", originalCurrencyLetterCode: "\(tr["originalCurrencyLetterCode"])", currencyLetterCode: "\(tr["currencyLetterCode"])", maskedPan: "\(tr["maskedPAN"])", originalAmountFormattedString: "\(tr["originalAmountFormattedString"])", mccCategoryId: "\(tr["mccCategoryId"])")
//                            data.append(temp)
//                        }
//                        completion(data)
//                    }else {
//                        failure()
//                    }
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Get transactions request failed, status: " + String(status))
//                    failure()
//                }
//            }
//        //}
//    }
//
//
//    /* Get all cards */
//    func getAllCards(completion: @escaping (([cardData]?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
//        //        if token as! String == "" {
//        //            self.generateMeaToken {
//        //                print("No meaToken")
//        //                self.getAllCards { (data) in
//        //                    completion(data)
//        //                } failure: {
//        //                    failure()
//        //                }
//        //            } failure: {}
//        //        }
//        //        else {
//        let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//
//        AF.request("\(BASE_URL)api/v1.0/CardManager/get-all-cards", method: .get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        var data:[cardData] = []
//
//                        for cardItem in json {
//                            let cardTest = cardItem.1
//                            let card = cardData()
//                            card.cardHolderFirstName = "\(cardTest["cardHolderFirstName"])"
//                            card.cardHolderLastName = "\(cardTest["cardHolderLastName"])"
//                            card.expirationMonth = "\(cardTest["expirationMonth"])"
//                            card.expirationYear = "\(cardTest["expirationYear"])"
//                            card.maskedPAN = "\(cardTest["maskedPAN"])"
//                            card.embossName = "\(cardTest["embossName"])"
//                            card.brandId = "\(cardTest["brandId"])"
//                            card.clientCardNumber = "\(cardTest["clientCardNumber"])"
//                            card.brandName = "\(cardTest["brandName"])"
//                            card.cardBalance = "\(cardTest["cardBalance"])"
//                            card.cardBalanceFormattedString = "\(cardTest["cardBalanceFormattedString"])"
//                            card.iban = "\(cardTest["iban"])"
//                            card.PAI = ""
//                            card.secretData = meaWalletData()
//                            card.socialSecurityNumber = "\(cardTest["socialSecurityNumber"])"
//
//                            data.append(card)
//                        }
//
//                        completion(data)
//
//
//                    }else {
//                        failure()
//                    }
//                } else if status == 401  { //unauthorized (expired token)
//                    self.sendResponseAsLog(response: response, status: status)
//                    //UserDefaults.standard.setValue("", forKey: "Meatoken")
////                    self.getAllCards { (data) in
////                        completion(data)
////                    } failure: {
////                        failure()
////                    }
//                    NSLog("-----GetAllCards request failed, get new token and retry status: " + String(status))
//                } else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----GetAllCards request failed, status: " + String(status))
//                    failure()
//                }
//            }
//        //}
//    }
//
//    /* Add cards */
//    func addCards(withParameters clientCardNumbers: [Int], completion: @escaping () -> Void, failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.addCards(withParameters: clientCardNumbers) {}
////                    failure: { failure() }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//            let parameters = ["clientCardNumbers" : clientCardNumbers]
//
//            AF.request("\(BASE_URL)api/v1.0/CardManager/add-cards", method: .put, parameters: parameters, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//
//                    }
//
//                    completion()
//
//
//                }else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    failure()
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----GetAllNot AddedCards request failed, status: " + String(status))
//                }
//            }
//        //}
//    }
//
//    /* Remove cards */
//    func removeCards(withParameters clientCardNumbers: [Int], completion: @escaping () -> Void, failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.addCards(withParameters: clientCardNumbers) {}
////                    failure: { failure() }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//            let parameters = ["clientCardNumbers" : clientCardNumbers]
//
//            AF.request("\(BASE_URL)api/v1.0/CardManager/remove-cards", method: .put, parameters: parameters, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                    }
//                    completion()
//
//                }else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    failure()
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Remove cards request failed, status: " + String(status))
//                }
//            }
//        //}
//    }
//
//
//
//
//    /* Get card services */
//
//     func getCardServices(clientCardNumber: Int, completion: @escaping ((cardServices?) -> Void), failure: @escaping () -> Void) {
//         let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//         NSLog("___________getCardServices request sent")
////         if token as! String == "" {
////             self.generateMeaToken {
////                 print("No meaToken")
////                 self.getCardServices(clientCardNumber: clientCardNumber) { (data) in
////                     completion(data)
////                 } failure: {
////                     failure()
////                 }
////             } failure: {}
////         }
////         else {
//             let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//
//             AF.request("\(BASE_URL)api/v1.0/CardSettings/get-card-services?clientCardNumber=\(clientCardNumber)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                 let status = response.response?.statusCode ?? 0
//                 if status == 200 {
//                     if let result = response.value {
//                         let json = JSON(result)
//                         if json == JSON.null {
//                             return
//                         }
//                         let cardServices = cardServices(serviceAllowATM: "\(json["serviceAllowATM"])", serviceAllowCNP: "\(json["serviceAllowCNP"])", serviceAllowPOS: "\(json["serviceAllowPOS"])", serviceAllowAbroad: "\(json["serviceAllowAbroad"])", cardStatus: "\(json["cardStatus"])", brandName: "\(json["brandName"])", maskedPAN: "\(json["maskedPAN"])")
//
//                         completion(cardServices)
//
//
//                     } else {
//                         failure()
//                     }
//                 } else if status == 401 { // unauthorized -> get new token and try again
//                     self.sendResponseAsLog(response: response, status: status)
////                     self.generateMeaToken {
////                         print("Unauthorized")
////                         self.getCardServices(clientCardNumber: clientCardNumber) { (data) in
////                             completion(data)
////                         } failure: {
////                             failure()
////                         }
////                     } failure: {}
//
//                 } else {
//                     self.sendResponseAsLog(response: response, status: status)
//                     //NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                     NSLog("-----Get Card Services request failed, status: " + String(status))
//                     failure()
//                 }
//             }
//         //}
//     }
//
//
//    /* Block/Unblock card services */
//    func setCardServices(cardServices: setCardServices, completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//        NSLog("___________setCardServices request sent")
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.setCardServices(cardServices: cardServices) { () in
////                    completion()
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//            AF.request("\(BASE_URL)api/v1.0/CardSettings/block-unblock-card-service", method: .put, parameters: cardServices, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        completion()
//
//                    }else {
//                        failure()
//                    }
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Set card services request failed, status: " + String(status))
//                    failure()
//                }
//            }
//        //}
//    }
//
//    ///api/v1.0/CardSettings/block-card
//    /* block card */
//
//    func blockCard (clientCardNumber: Int, completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.blockCard(clientCardNumber: clientCardNumber) { () in
////                    completion()
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//           let params = ["clientCardNumber": clientCardNumber]
//
//            AF.request("\(BASE_URL)api/v1.0/CardSettings/block-card", method: .put, parameters: params, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//                    completion()
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Block card request failed, status: \(status)" )
//                    failure()
//                }
//            }
//        //}
//    }
//
//    ///api/v1.0/CardSettings/activate-card
//    /* activate card */
//    func activateCard (clientCardNumber: Int, completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.activateCard(clientCardNumber: clientCardNumber) { () in
////                    completion()
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//           let params = ["clientCardNumber": clientCardNumber]
//
//            AF.request("\(BASE_URL)api/v1.0/CardSettings/activate-card", method: .put, parameters: params, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//                        completion()
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Activate card request failed, status: " + String(status))
//                    failure()
//                }
//            }
//        //}
//    }
//
//
//    ///api/v1.0/CardSettings/get-epin
//    /* get ePIN */
//    func getEPin (clientCardNumber: Int, completion: @escaping ((String?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.getEPin(clientCardNumber: clientCardNumber) { (res) in
////                    completion(res)
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//           let params = ["clientCardNumber": clientCardNumber]
//
//            AF.request("\(BASE_URL)api/v1.0/CardSettings/get-epin", method: .get, parameters: params, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        let ePIN = "\(json["epin"])"
//                        completion(ePIN)
//
//                    }else {
//                        failure()
//                    }
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Get ePIN request failed, status: \(status)" )
//                    failure()
//                }
//            }
//        //}
//    }
//
//    /* set ePIN */
//    func setEPin (clientCardNumber: Int, ePIN: String, completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.setEPin(clientCardNumber: clientCardNumber, ePIN: ePIN) { () in
////                    completion()
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//            let data = setEPinData()
//            data.clientCardNumber = clientCardNumber
//            data.epin = ePIN
//
//            AF.request("\(BASE_URL)api/v1.0/CardSettings/block-card", method: .put, parameters: data, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//
//                        completion()
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Set ePIN request failed, status: \(status)" )
//                    failure()
//                }
//            }
//        //}
//    }
//
//    ///api/v1.0/FinanceOperations/credit-info
//    /* get credit info */
//    func getCreditInfo (clientCardNumber: Int, completion: @escaping (([creditOperation]?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.getCreditInfo(clientCardNumber: clientCardNumber) { (res) in
////                    completion(res)
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//           let params = ["clientCardNumber": clientCardNumber]
//
//            AF.request("\(BASE_URL)api/v1.0/FinanceOperations/credit-info", method: .get, parameters: params, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        var data:[creditOperation] = []
//
//                        let operations = json["creditOperations"]
//
//                        for operation in operations {
//                            let cr = operation.1
//                            let credit = creditOperation(date: "\(cr["date"])", amount: "\(cr["amount"])", clientCardNumber: "\(cr["clientCardNumber"])", currencyCode: "\(cr["currencyCode"])", productId: "\(cr["productId"])", description: "\(cr["description"])", amountFirmattedString: "\(cr["amountFormattedString"])")
//
//                            data.append(credit)
//                        }
//
//                        completion(data)
//
//                    }else {
//                        failure()
//                    }
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    //NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Get credit info request failed, status: \(status)" )
//                    failure()
//                }
//            }
//        //}
//    }
//
//    /* check if card belongs to another app*/
//    func checkCreditCard (clientCardNumber: Int, socialSecurityNumber: String, completion: @escaping (([String]) -> Void), failure: @escaping () -> Void) {
//
//        let token = UserDefaults.standard.value(forKey: "token") ?? ""
//        let headers = ["Authorization": "Bearer \(token)", "Content-Type": "application/json"]
//        var id : String = UserDefaults.standard.value(forKey: "applicationId") as? String ?? ""
//        if id == "" {
//            id = NSUUID().uuidString
//        }
//
//        let params = ["socialSecurityNumber": socialSecurityNumber, "clientCardNumber": clientCardNumber, "applicationInstallationUUID": id] as [String : Any]
//
//        AF.request("\(BASE_URL)api/v1.0/ClientManager/check-if-card-belongs-to-another-app", method: .get, parameters: params, encoding: URLEncoding.queryString, headers: HTTPHeaders(headers)).responseJSON { response in
//            let status = response.response?.statusCode ?? 0
//            if status == 200 {
//                UserDefaults.standard.setValue(id, forKey: "applicationId")
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//
//                    let jsonDictionary = json.dictionary
//                    var data: [String] = []
//                    let check = (jsonDictionary?["cardBelongsToAnotherApp"])?.description
//                    data.append(check ?? "")
//                    let brandName = (jsonDictionary?["brandName"])?.debugDescription
//                    data.append(brandName ?? "")
//
//                    completion(data)
//
//                }else {
//                    failure()
//                }
//            } else if status == 400 {
//                self.sendResponseAsLog(response: response, status: status)
//                if let result = response.value {
//                    let json = JSON(result)
//                    if json == JSON.null {
//                        return
//                    }
//                    let errorCode =  "\(json["errorCode"])"
//                    if errorCode=="531" || errorCode=="543" {
//                        NotificationCenter.default.post(name: NSNotification.Name("invalidArguments"), object: nil)
//                        failure()
//                    }
//                    else if errorCode=="1009" {
//                        NotificationCenter.default.post(name: NSNotification.Name("cardNotActive"), object: nil)
//                        failure()
//                    }
//                    else if errorCode=="1010" {
//                        NotificationCenter.default.post(name: NSNotification.Name("brandNotSupported"), object: nil)
//                        failure()
//                    } else {
//                        NotificationCenter.default.post(name: NSNotification.Name("connectionFailed"), object: nil)
//                        NSLog("-----Check credit card request failed, status: \(status)" )
//                        failure()
//                    }
//                } else {
//                    NotificationCenter.default.post(name: NSNotification.Name("connectionFailed"), object: nil)
//                    NSLog("-----Check credit card request failed, status: \(status)" )
//                    failure()
//                }
//            } else {
//                self.sendResponseAsLog(response: response, status: status)
//                NotificationCenter.default.post(name: NSNotification.Name("connectionFailed"), object: nil)
//                NSLog("-----Check credit card request failed, status: \(status)" )
//                failure()
//            }
//        }
//    }
//
//
////
////            else {
////                self.sendLog(response: response, status: status)
////                NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
////                NSLog("-----Check credit card request failed, status: \(status)" )
////                failure()
////            }
////        }
////    }
//
//    ///api/v1.0/CardManager/credit-progress
//    /* Get credit progress */
//    func getCreditProgress(clientCardNumber: Int, completion: @escaping ((creditProgress?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.getCreditProgress(clientCardNumber: clientCardNumber) { (data) in
////                    completion(data)
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//
//            AF.request("\(BASE_URL)api/v1.0/CardManager/credit-progress?clientCardNumber=\(clientCardNumber)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                               if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        let credit = creditProgress()
//                        credit.totalDueString = "\(json["totalDueString"])"
//                        credit.currentMpvString = "\(json["currentMpvString"])"
//                        credit.lastPayoffDate = "\(json["lastPayoffDate"])"
//                        credit.lastPayoffSumString = "\(json["lastPayoffSumString"])"
//                        credit.lastWithdrawnDate = "\(json["lastWithdrawnDate"])"
//                        credit.lastWithdrawnAmountString = "\(json["lastWithdrawnAmountString"])"
//                        credit.payedSumString = "\(json["payedSumString"])"
//                        credit.totalLegalTaxString = "\(json["totalLegalTaxString"])"
//                        credit.currentMpv = Double("\(json["currentMpv"])")
//                        credit.totalDue = Double("\(json["totalDue"])")
//
//                        completion(credit)
//
//                    }else {
//                        failure()
//                    }
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    //NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Get credit progress request failed, status: " + String(status))
//                    failure()
//                }
//            }
//        //}
//    }
//
//    ///api/v1.0/TransactionAuthenticationRequests/get-transaction-authentication-request
//    func getTransactionAuthentication (requestId: String, completion: @escaping ((notification?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.getTransactionAuthentication(requestId: requestId) { (data) in
////                    completion(data)
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//
//            AF.request("\(BASE_URL)api/v1.0/TransactionAuthenticationRequests/get-transaction-authentication-request?AuthenticationRequestId=\(requestId)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                               if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        let transactionNotification = notification(merchantName: "\(json["merchantName"])", amountFormattedString: "\(json["amountFormattedString"])", authenticationRequestDateUTC: "\(json["authenticationRequestDateUTC"])", authenticationExpirationDateUTC: "\(json["authenticationExpirationDateUTC"])", cardMaskedPAN: "\(json["cardMaskedPAN"])", status: "\(json["status"])", expired: "\(json["expired"])", seenByUser: "\(json["seenByUser"])", authenticationRequestId: "\(json["authenticationRequestId"])", resultStatus: "\(json["resultStatus"])", institutionId: "\(json["institutionId"])")
//
//                        completion(transactionNotification)
//
//                    }else {
//                        failure()
//                    }
//                }
//                else {
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Get transaction authentication request failed, status: " + String(status))
//
//                    failure()
//                }
//            }
//        //}
//    }
//
//    ///api/v1.0/TransactionAuthenticationRequests/status-update
//    func updateTransactionStatus (data: transactionAuthenticationRequest, completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.updateTransactionStatus(data: data) { () in
////                    completion()
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//            AF.request("\(BASE_URL)api/v1.0/TransactionAuthenticationRequests/status-update", method: .put, parameters: data, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//
//                    completion()
//                }
//                else {
//                    var errorCode = ""
//                    var errorText = ""
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        errorCode =  "\(json["errorCode"])"
//                        errorText = "\(json["errorText"])"
//                    }
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----api/v1.0/TransactionAuthenticationRequests/status-update request failed, status: \(status), errorCode: \(errorCode), errorText: \(errorText)")
//                    failure()
//                }
//            }
//        //}
//    }
//    ///api/v1.0/TransactionAuthenticationRequests/get-all-authentication-requests
//    /* Get All Transaction Authentication Requests */
//    func getTransactionAuthenticationRequests(skip: Int, take: Int, onlyPending: Bool, completion: @escaping (([notification]?) -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//
////        if token as! String == "" {
////            self.generateMeaToken {
////                print("No meaToken")
////                self.getTransactionAuthenticationRequests(skip: skip, take: take, onlyPending: onlyPending){ (data) in
////                    completion(data)
////                } failure: {
////                    failure()
////                }
////            } failure: {}
////        }
////        else {
//            let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//            //let clientNumber = UserDefaults.standard.value(forKey: "clientNumber") ?? ""
//
//            let parameters: Parameters = [
//                "skip":"\(skip)",
//                "take": "\(take)",
//                "onlyPending": "\(onlyPending)"]
//
//            AF.request("\(BASE_URL)api/v1.0/TransactionAuthenticationRequests/get-all-authentication-requests", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseJSON { response in
//                let status = response.response?.statusCode ?? 0
//                if status == 200 {
//                    if let result = response.value {
//                        let json = JSON(result)
//                        if json == JSON.null {
//                            return
//                        }
//                        var data:[notification] = []
//
//                        for trans in json["authenticationRequests"] {
//                           let tr = trans.1
//                            let temp = notification(merchantName: "\(tr["merchantName"])", amountFormattedString: "\(tr["amountFormattedString"])", authenticationRequestDateUTC: "\(tr["authenticationRequestDateUTC"])", authenticationExpirationDateUTC: "\(tr["authenticationExpirationDateUTC"])", cardMaskedPAN: "\(tr["cardMaskedPAN"])", status: "\(tr["status"])", expired: "\(tr["expired"])", seenByUser: "\(tr["seenByUser"])", authenticationRequestId: "\(tr["authenticationRequestId"])", resultStatus: "\(tr["resultStatus"])", institutionId: "\(tr["institutionId"])")
//                          data.append(temp)
//                     }
//                        completion(data)
//                    }else {
//                        failure()
//                    }
//                }
//                else {
//
//                    self.sendResponseAsLog(response: response, status: status)
//                    NotificationCenter.default.post(name: NSNotification.Name("errorAlert"), object: nil)
//                    NSLog("-----Get All Transaction Authentication Requests failed, status: " + String(status))
//                    failure()
//                }
//            }
//        //}
//    }
//
//    ///api/v1.0/MobileApplications/application-log
//    func log(withParameters logData: logData, completion: @escaping (() -> Void), failure: @escaping () -> Void) {
//        let token = UserDefaults.standard.value(forKey: "Meatoken") ?? ""
//        let headers = ["Content-Type": "application/json","Authorization": "Bearer \(token)"]
//
//        AF.request("\(BASE_URL)api/v1.0/MobileApplications/application-log", method: .post, parameters: logData, encoder: JSONParameterEncoder.sortedKeys, headers: HTTPHeaders(headers)).responseJSON { response in
//
//            let status = response.response?.statusCode ?? 0
//            if status == 200 {
//
//                completion()
//
//            } else {
//                NSLog("-----send log to API request failed, status: \(status), logData: \(logData.text ?? "")")
//                failure()
//            }
//        }
//    }
//
//    func sendResponseAsLog(response: Alamofire.AFDataResponse<Any>, status: Int){
//        if status != 401 && status != 403 {
//            let log = logData()
//            log.type = 2
//            let requestText = response.request?.description
//            let responseText = response.response?.description
//            let responseResult = response.value.debugDescription
//            log.text = "Request: \(requestText ?? "") \n Response: \(responseText ?? "") \n Result: \(responseResult)"
//            self.log(withParameters: log) {} failure: {}
//        }
//    }
//
//        func sendStringAsLog(message: String){
//                let log = logData()
//                log.text = message
//                self.log(withParameters: log) {} failure: {}
//        }
}




