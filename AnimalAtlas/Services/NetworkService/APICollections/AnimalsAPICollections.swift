//
//  AnimalAPICollections.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

public struct AnimalAPICollections {
    static func getAnimal(by name: String) -> APIDataRequest {
        NinjaAPI<AnimalResponse>(.get, path: "/animals").query(["name": name])
    }
}
