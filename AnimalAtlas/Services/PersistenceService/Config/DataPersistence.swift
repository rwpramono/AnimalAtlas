//
//  DataPersistence.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

protocol DataPersistence {
    func save<T: Codable>(_ data: T) throws
    func load<T: Codable>(_ data: T.Type) throws -> T
    func delete<T: Codable>(_ data: T) throws
}
