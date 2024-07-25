//
//  APIDataRequest.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

protocol APIDataRequest {
    var urlRequest: URLRequest? { get }
    var urlComponent: URLComponents? { get }

    init(_ httpMethod: HttpMethod, path: String)
    
    func body(_ body: [String : Any]) -> Self
    func query(_ query: [String : String]) -> Self
}
