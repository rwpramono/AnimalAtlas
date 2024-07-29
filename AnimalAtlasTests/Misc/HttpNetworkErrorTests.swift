//
//  HttpNetworkErrorTests.swift
//  AnimalAtlasTests
//
//  Created by Rachmat Wahyu Pramono on 29/07/24.
//

import XCTest

@testable import AnimalAtlas

final class HttpNetworkErrorTests: XCTestCase {
    
    func test_should_return_network_error_failed() throws {
        let sut = HttpNetworkError.failed
        XCTAssertEqual(sut.localizedDescription, "API request failed")
    }
    
    func test_should_return_network_error_badRequest() throws {
        let sut = HttpNetworkError.badRequest
        XCTAssertEqual(sut.localizedDescription, "Bad request")
    }
    
    func test_should_return_network_error_noResponseData() throws {
        let sut = HttpNetworkError.noResponseData
        XCTAssertEqual(sut.localizedDescription, "Empty response data")
    }

    
    func test_should_return_network_error_invalidAPIDataProtocol() throws {
        let sut = HttpNetworkError.invalidAPIDataRequest
        XCTAssertEqual(sut.localizedDescription, "Invalid API Data Request")
    }

    func test_should_return_network_error_unableToDecodeResponseData() throws {
        let sut = HttpNetworkError.unableToDecodeResponseData
        XCTAssertEqual(sut.localizedDescription, "Unable to decode response object")
    }

    func test_should_return_network_error_otherMessage() throws {
        let mockedMessage = "Status code 599"
        let sut = HttpNetworkError.other(message: mockedMessage)
        XCTAssertEqual(sut.localizedDescription, mockedMessage)
    }
}
