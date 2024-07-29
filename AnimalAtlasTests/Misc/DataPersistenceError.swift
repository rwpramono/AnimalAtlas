//
//  DataPersistenceError.swift
//  AnimalAtlasTests
//
//  Created by Rachmat Wahyu Pramono on 29/07/24.
//

import XCTest

@testable import AnimalAtlas

final class DataPersistenceErrorTests: XCTestCase {
    func test_should_return_failed_to_save_with_reasons() throws {
        let sut = DataPersistenceError.loadFailed(HttpNetworkError.badRequest)
        XCTAssertEqual(sut.localizedDescription, "Failed to load: Bad request")
    }
    
    func test_should_return_failed_to_load_with_reasons() throws {
        let sut = DataPersistenceError.saveFailed(HttpNetworkError.badRequest)
        XCTAssertEqual(sut.localizedDescription, "Failed to save: Bad request")
    }
    
    func test_should_return_invalid_entity_with_reasons() throws {
        let sut = DataPersistenceError.invalidEntityName
        XCTAssertEqual(sut.localizedDescription, "Invalid Entity Name")
    }
    
    func test_should_return_missing_context_with_reasons() throws {
        let sut = DataPersistenceError.missingContext
        XCTAssertEqual(sut.localizedDescription, "Missing Managed Object Context")
    }
    
    func test_should_return_data_entity_not_found_with_reasons() throws {
        let sut = DataPersistenceError.predicateDataNotFound
        XCTAssertEqual(sut.localizedDescription, "Predicate Data Entity Not Found")
    }
    
    func test_should_return_failed_to_delete_with_reasons() throws {
        let sut = DataPersistenceError.deleteFailed(HttpNetworkError.badRequest)
        XCTAssertEqual(sut.localizedDescription, "Failed to delete: Bad request")
    }
}
