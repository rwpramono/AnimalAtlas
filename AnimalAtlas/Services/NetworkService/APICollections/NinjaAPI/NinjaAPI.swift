//
//  NinjaAPI.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

public struct NinjaAPI<T: Decodable>: APIDataRequest {
    public private(set) var urlRequest: URLRequest?
    public private(set) var urlComponent: URLComponents?
    
    init(_ httpMethod: HttpMethod, path: String) {
        guard let urlComponent = URLComponents(string: "some base url" + path),
              let completeUrl = urlComponent.url else {
            self.urlRequest = nil
            self.urlComponent = nil
            return
        }
        var urlRequest = URLRequest(url: completeUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "X-Api-Key": "some api key"
        ]
        self.urlComponent = urlComponent
        self.urlRequest = urlRequest
    }

    public func body(_ body: [String : Any]) -> NinjaAPI<T> {
        var apiAttribute = self
        let bodyData = try? JSONSerialization.data(withJSONObject: body)
        apiAttribute.urlRequest?.httpBody = bodyData
        return apiAttribute
    }
    
    public func query(_ query: [String : String]) -> NinjaAPI<T> {
        var apiAttribute = self
        apiAttribute.urlComponent?.queryItems = query.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        return apiAttribute
    }
}
