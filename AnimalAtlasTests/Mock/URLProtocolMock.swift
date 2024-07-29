//
//  URLProtocolMock.swift
//  AnimalAtlasTests
//
//  Created by Rachmat Wahyu Pramono on 29/07/24.
//

import Foundation

final class URLProtocolMock: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?

    override final class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override final class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func stopLoading() { }

    override func startLoading() {
        guard let handler = URLProtocolMock.requestHandler else {
            assertionFailure("The handler is not provided!")
            return
        }

        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
}
