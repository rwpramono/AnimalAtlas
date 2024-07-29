//
//  ImageAPICollections.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 29/07/24.
//

import Foundation

public struct ImageAPI: APIDataRequest {
    public private(set) var urlRequest: URLRequest?
    public private(set) var urlComponent: URLComponents?

    init(_ httpMethod: HttpMethod, path: String) {
        guard let urlComponent = URLComponents(string: path),
              let completeUrl = urlComponent.url else {
            self.urlRequest = nil
            self.urlComponent = nil
            return
        }
        var urlRequest = URLRequest(url: completeUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        urlRequest.httpMethod = httpMethod.rawValue
        self.urlComponent = urlComponent
        self.urlRequest = urlRequest
    }
    
    func body(_ body: [String : Any]) -> ImageAPI {
        // Add body if needed
        return self
    }
    
    func query(_ query: [String : String]) -> ImageAPI {
        // Add query if needed
        return self
    }
}
