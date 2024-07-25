//
//  HttpNetworkError.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

public enum HttpNetworkError: Error, LocalizedError {
    case failed
    case badRequest
    case noResponseData
    case invalidAPIDataRequest
    case unableToDecodeResponseData
    case other(message: String?)
    
    public var errorDescription: String? {
        switch self {
        case .failed:
            return "API request failed"
        case .badRequest:
            return "Bad request"
        case .noResponseData:
            return "Empty response data"
        case .invalidAPIDataRequest:
            return "Invalid API Data Request"
        case .unableToDecodeResponseData:
            return "Unable to decode response object"
        case .other(message: let message):
            return message
        }
    }
}
