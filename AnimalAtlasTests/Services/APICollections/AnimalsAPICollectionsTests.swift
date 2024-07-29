//
//  AnimalsAPICollectionsTests.swift
//  AnimalAtlasTests
//
//  Created by Rachmat Wahyu Pramono on 29/07/24.
//

import XCTest

@testable import AnimalAtlas

final class AnimalsAPICollectionsTests: XCTestCase {
    func test_getAnimal_should_return_not_nil() throws {
        let sut = AnimalAPICollections.getAnimal(by: "/dummy")
        
        XCTAssertNotNil(sut.urlRequest)
        XCTAssertNotNil(sut.urlComponent)
        XCTAssertEqual(sut.urlComponent?.path, "/v1/animals")
    }
    
    func test_searchPhoto_should_return_not_nil() throws {
        let sut = AnimalAPICollections.searchAnimalPhoto(by: "/dummy")
        
        XCTAssertNotNil(sut.urlRequest)
        XCTAssertNotNil(sut.urlComponent)
        XCTAssertEqual(sut.urlComponent?.path, "/v1/search")
    }

}
