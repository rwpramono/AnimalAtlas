//
//  FeatureFactoryTests.swift
//  AnimalAtlasTests
//
//  Created by Rachmat Wahyu Pramono on 29/07/24.
//

import XCTest

@testable import AnimalAtlas

final class FeatureFactoryTests: XCTestCase {
    
    func test_should_return_AnimalList_VC() throws {
        let sut = AnimalListFactory.makeAnimalListVC()
        XCTAssertEqual(String(describing: type(of: sut)), "AnimalListVC")
    }
    
    func test_should_return_AnimalGroup_VC() throws {
        let sut = AnimalGroupFactory.makeAnimalGroupVC(AnimalGroup(groupName: "dumm", animalNames: []))
        XCTAssertEqual(String(describing: type(of: sut)), "AnimalGroupVC")
    }

    func test_should_return_FavoriteAnimal_VC() throws {
        let sut = FavoriteAnimalFactory.makeFavoriteAnimalVC()
        XCTAssertEqual(String(describing: type(of: sut)), "FavoriteAnimalVC")
    }
}
