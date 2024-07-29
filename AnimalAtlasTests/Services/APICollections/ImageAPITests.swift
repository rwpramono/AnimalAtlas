//
//  ImageAPITests.swift
//  AnimalAtlasTests
//
//  Created by Rachmat Wahyu Pramono on 29/07/24.
//

import XCTest

@testable import AnimalAtlas

final class ImageAPITests: XCTestCase {
    struct Dummy: Codable, Hashable {
        let dummyValue: String
    }
    
    func test_should_return_not_nil() throws {
        let sut = ImageAPI(.get, path: "/dummy")
            .body(["dummy":"dummy"])
            .query(["dummy":"dummy"])
        XCTAssertNotNil(sut.urlRequest)
        XCTAssertNotNil(sut.urlComponent)
        XCTAssertEqual(sut.urlComponent?.path, "/dummy")
    }
}
