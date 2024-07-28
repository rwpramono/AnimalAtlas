//
//  DataPersistence.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

protocol DataPersistence {
    associatedtype T: Codable

    func load() throws -> [T]
    func add(_ object: T) throws
    func delete(_ object: T) throws
}
