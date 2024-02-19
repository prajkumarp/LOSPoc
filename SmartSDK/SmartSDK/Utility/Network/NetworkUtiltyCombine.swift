//
//  NetworkUtiltyCombine.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 17/07/23.
//

import Foundation
import Combine

struct NetworkUtilityCombine {
    
    static func makeAPICall<T: Decodable>(urlString: String, httpMethod: String, bodyData: Data? = nil) -> AnyPublisher<T, Error> {
        
        guard let url = URL(string: urlString) else {
            return Fail(error: NSError(domain: "Invalid URL", code: 0, userInfo: nil)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.httpBody = bodyData
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw NSError(domain: "Invalid response", code: 0, userInfo: nil)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


// MARK: - Usage
//
//let cancellable = NetworkUtility.makeAPICall(urlString: "https://api.example.com/users", httpMethod: "GET")
//    .sink(receiveCompletion: { completion in
//        switch completion {
//        case .finished:
//            print("Request finished successfully.")
//        case .failure(let error):
//            print("Request failed with error: \(error)")
//        }
//    }, receiveValue: { data in
//        print("Received data: \(data)")
//    })
