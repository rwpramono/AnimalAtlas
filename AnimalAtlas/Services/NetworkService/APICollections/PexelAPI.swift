//
//  PexelAPI.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

public struct PexelAPI<T: Decodable>: APIDataRequest {
    public private(set) var urlRequest: URLRequest?
    public private(set) var urlComponent: URLComponents?
    
    init(_ httpMethod: HttpMethod, path: String) {
        guard let urlComponent = URLComponents(string: "https://api.pexels.com/v1/" + path),
              let completeUrl = urlComponent.url else {
            self.urlRequest = nil
            self.urlComponent = nil
            return
        }
        var urlRequest = URLRequest(url: completeUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Authorization": "F0RsC7L6viQO7bzFmZTKs7hwGWhXlwm5TjAozyXUwkTmB8INisxbwjVg"
        ]
        self.urlComponent = urlComponent
        self.urlRequest = urlRequest
    }

    public func body(_ body: [String : Any]) -> PexelAPI<T> {
        var apiAttribute = self
        let bodyData = try? JSONSerialization.data(withJSONObject: body)
        apiAttribute.urlRequest?.httpBody = bodyData
        return apiAttribute
    }
    
    public func query(_ query: [String : String]) -> PexelAPI<T> {
        var apiAttribute = self
        apiAttribute.urlComponent?.queryItems = query.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        apiAttribute.urlRequest?.url = apiAttribute.urlComponent?.url
        return apiAttribute
    }
}
