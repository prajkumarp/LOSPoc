//
//  enums.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 10/07/23.
//

import Foundation

enum TabSections:Int{
    case homeTab = 1,purchases,cash,shop,profile
}

// MARK: - Analytics and events

enum EventTypes:Int{
    case log = 1,navigation,cta,apiRequest,apiResponse,alert,error,exception
}

enum LogLevels:Int{
    case error = 1,warning,info,debug,verbose
}

// MARK: - Cache keys
enum cacheType: String {
    case runtime = "runtime"
    case local   = "local"
    case secure  = "secure"
}

// MARK: - SMS Validation

enum SMSValidationStatus : String{
    case success = "success"
    case failed = "error"
    case notreachable = "notreachable"
    case unknown = "unknown"
    case noInternet = "NoInternet"
}

enum SMSValidationCode:Int{
    case success = 200
    case verificationFailed = 400
    case tryAgainLater = 403
    case unknown = 500
    case somethingWentWrong = 404
    case tooManyAttempts = 429
    case unabletoSend = 412
    case noInternet = 0
    case SMSFailure = 1
}

// MARK: - Button text

enum ButtonTitleText:String{
    case Try_again = "Try again"
    case Exit = "Exit"
    case Try_alternate_verification = "Try alternate verification"
    case Verify_with_OTP = "Verify with OTP"
    case Try_again_later = "Try again later"
    case Retry_with_SMS = "Retry with SMS"
}

// MARK: - Network enums
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    // Add more HTTP methods as needed
}

enum NetworkError: Error {
    case invalidURL
    case invalidData
    case invalidResponse
    case httpError(Int)
}


// MARK: - Enum extension
/**
 * Extend all enums with a simple method to derive their names.
 */
extension RawRepresentable where RawValue: Any {
  /**
   * The name of the enumeration (as written in case).
   */
  var name: String {
    get { return String(describing: self) }
  }

  /**
   * The full name of the enumeration
   * (the name of the enum plus dot plus the name as written in case).
   */
  var description: String {
    get { return String(reflecting: self) }
  }
}
