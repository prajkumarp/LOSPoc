//
//  NetworkUtility.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 17/07/23.
//

import Foundation

class NetworkUtility {
    
    private var baseURLString:String = ""
    private var authBaseURLString:String = ""
    
    init(){
        baseURLString = getBaseURL()
        authBaseURLString = getAuthBaseURL()
    }
    
    typealias CompletionHandler<T: Decodable> = (Result<T, Error>) -> Void
    
    static func makeAPICall<T: Decodable>(urlString: String, method: HTTPMethod, bodyData: Data? = nil, completionHandler: @escaping CompletionHandler<T>) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = bodyData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(NetworkError.invalidData))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                switch statusCode {
                case 200..<300:
                    // Successful response
                    do {
                        
                        EventManager().sendEventDetails(
                            eventDetails: constructEventDetailsforLog(
                                url: urlString,
                                requestData: (bodyData?.base64EncodedString()) ?? "",
                                responseData: data.base64EncodedString(),
                                statuscode: statusCode
                            )
                        )
                        
//                        let jsonData = try JSONSerialization.jsonObject(with: data)
                        
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(.success(decodedData))
                    } catch {
                        
                        EventManager().sendEventDetails(
                            eventDetails: constructEventDetailsforErrorLog(
                                url: urlString,
                                requestData: (bodyData?.base64EncodedString()) ?? "",
                                error: error.localizedDescription,
                                statuscode: statusCode
                            )
                        )
                        
                        
                        completionHandler(.failure(error))
                    }
                default:
                    
                    // Unsuccessful response
                    EventManager().sendEventDetails(
                        eventDetails: constructEventDetailsforErrorLog(
                            url: urlString,
                            requestData: (bodyData?.base64EncodedString()) ?? "",
                            error: NetworkError.httpError(statusCode).localizedDescription,
                            statuscode: statusCode
                        )
                    )
                    completionHandler(.failure(NetworkError.httpError(statusCode)))
                }
            } else {
                
                EventManager().sendEventDetails(
                    eventDetails: constructEventDetailsforErrorLog(
                        url: urlString,
                        requestData: (bodyData?.base64EncodedString())!,
                        error: NetworkError.invalidResponse.localizedDescription,
                        statuscode: 0
                    )
                )
                completionHandler(.failure(NetworkError.invalidResponse))
            }
        }.resume()
    }
    
    // MARK: - Environment
    func getBaseURL()->String{
        
        var baseURLString = CacheManager.sharedInstance.getStringfor(key: CacheKeys.baseURLString)
        
        if (baseURLString == ""){
            
            let config = ConfigHelper.sharedInstance.config
            
            let baseURL = config![CacheKeys.baseURLString] as! Dictionary<String,Any>
#if STAGING
            // Code to execute only in debug mode
            baseURLString = baseURL["Staging"] as! String
#else
            // Code to execute in release mode
            baseURLString = baseURL["Prod"] as! String
#endif
            CacheManager.sharedInstance.putStringfor(key: CacheKeys.baseURLString, value: baseURLString)
        }
        
        return baseURLString
    }
    
    
    func getAuthBaseURL()->String{
        
        var authBaseURLString = CacheManager.sharedInstance.getStringfor(key: CacheKeys.AuthBaseURLString)
        
        if (authBaseURLString == ""){
            
            let config = ConfigHelper.sharedInstance.config
            
            let authBaseURL = config![CacheKeys.AuthBaseURLString] as! Dictionary<String,Any>
#if STAGING
            // Code to execute only in debug mode
            authBaseURLString = authBaseURL["Staging"] as! String
#else
            // Code to execute in release mode
            authBaseURLString = authBaseURL["Prod"] as! String
#endif
            CacheManager.sharedInstance.putStringfor(key: CacheKeys.AuthBaseURLString, value: authBaseURLString)
        }
        
        return authBaseURLString
    }
    
    
}



// MARK: - Analytics
private func constructEventDetailsforLog(url:String,requestData:String,responseData:String,statuscode: Int) -> EventDetails{
    
    let eventDetails = EventDetails()
    
    eventDetails.type = .apiResponse
    
    eventDetails.payload = ["URL":url,
                            "StatusCode":statuscode.description,
                            "request":requestData,
                            "response":responseData]
    return eventDetails
}

private func constructEventDetailsforErrorLog(url:String,requestData:String,error:String,statuscode: Int) -> EventDetails{
    
    let eventDetails = EventDetails()
    
    eventDetails.type = .error
    
    eventDetails.payload = ["URL":url,
                            "StatusCode":statuscode.description,
                            "request":requestData,
                            "error":error]
    return eventDetails
}



// MARK: - Sample of how to use it
// TODO: - Below code should be removed after authentication workflow
//// MARK: - Test api
//private func testGetApiCall(){
//    
////    https://reqres.in/api/users?page=2
//    
//    let urlString = "https://reqres.in/api/users?page=2"
////        let bodyData = "your-request-body-data".data(using: .utf8)
//
//    NetworkUtility.makeAPICall(urlString: urlString, method: .get) { (result: Result<ResponseData, Error>) in
//        switch result {
//        case .success(let responseData):
//            // Process the successful response data
//            print(responseData)
//        case .failure(let error):
//            // Handle the error
//            print("Error: \(error)")
//        }
//    }
//    
//}
//}
//
//
//struct ResponseData: Decodable {
//let page, perPage, total, totalPages: Int
//let data: [Datum]
//let support: Support
//
//enum CodingKeys: String, CodingKey {
//    case page
//    case perPage = "per_page"
//    case total
//    case totalPages = "total_pages"
//    case data, support
//}
//}
//
//// MARK: - Datum
//struct Datum: Decodable {
//let id: Int
//let email, firstName, lastName: String
//let avatar: String
//
//enum CodingKeys: String, CodingKey {
//    case id, email
//    case firstName = "first_name"
//    case lastName = "last_name"
//    case avatar
//}
//}
//
//// MARK: - Support
//struct Support: Decodable {
//let url: String
//let text: String
//}


// Usage:
//struct ResponseData: Decodable {
//    let id: Int
//    let name: String
//    // Add more properties as needed
//}
//
//let urlString = "https://your-api-url.com"
//let bodyData = "your-request-body-data".data(using: .utf8)
//
//NetworkUtility.makeAPICall(urlString: urlString, method: .get) { (result: Result<ResponseData, Error>) in
//    switch result {
//    case .success(let responseData):
//        // Process the successful response data
//        print(responseData)
//    case .failure(let error):
//        // Handle the error
//        print("Error: \(error)")
//    }
//}
//
//NetworkUtility.makeAPICall(urlString: urlString, method: .post, bodyData: bodyData) { (result: Result<ResponseData, Error>) in
//    switch result {
//    case .success(let responseData):
//        // Process the successful response data
//        print(responseData)
//    case .failure(let error):
//        // Handle the error
//        print("Error: \(error)")
//    }
//}
