//  EPS Digital Wallet

import Foundation
//import SwiftOTP

public class TokenDecoder {
    
    public init(){}
    
func decode(jwtToken jwt: String) -> [String: Any] {
      let segments = jwt.components(separatedBy: ".")
      return decodeJWTPart(segments[1]) ?? [:]
    }

    func base64UrlDecode(_ value: String) -> Data? {
      var base64 = value
        .replacingOccurrences(of: "-", with: "+")
        .replacingOccurrences(of: "_", with: "/")

      let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
      let requiredLength = 4 * ceil(length / 4.0)
      let paddingLength = requiredLength - length
      if paddingLength > 0 {
        let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
        base64 = base64 + padding
      }
      return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
    }

    func decodeJWTPart(_ value: String) -> [String: Any]? {
      guard let bodyData = base64UrlDecode(value),
        let json = try? JSONSerialization.jsonObject(with: bodyData, options: []), let payload = json as? [String: Any] else {
          return nil
      }

      return payload
    }
    
//    func generateTOTP() -> String {
//        let secretKey = UserDefaults.standard.value(forKey: "secretKey") as! String
//
//        let data = Data(secretKey.bytes)
//        if let totp = TOTP(secret: data , digits: 6, timeInterval: 30, algorithm: .sha512) {
//            let otpString = totp.generate(time: Date())
//            NSLog("Date: \(Date())")
//            NSLog("----------------TOTP: \(otpString ?? "")")
//
//            return otpString ?? ""
//        } else {
//            return ""
//        }
//    }
}
