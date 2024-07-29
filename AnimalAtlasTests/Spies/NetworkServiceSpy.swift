//
//  NetworkServiceSpy.swift
//  AnimalAtlasTests
//
//  Created by Rachmat Wahyu Pramono on 29/07/24.
//

import Combine
import Foundation
@testable import AnimalAtlas

final class NetworkServiceSpy: URLSessionService {
    
    init() {
        let mockDecoder = JSONDecoder()
        let config: URLSessionConfiguration = .ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let mockSession = URLSession(configuration: config)
        super.init(session: mockSession, decoder: mockDecoder)
    }
}
