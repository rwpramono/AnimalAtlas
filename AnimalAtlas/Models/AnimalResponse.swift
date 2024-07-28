//
//  AnimalResponse.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

public typealias AnimalResponse = [AnimalResponseElement]

// MARK: - AnimalResponseElement
public struct AnimalResponseElement: Codable {
    public let name: String

    public init(name: String) {
        self.name = name
    }
}
