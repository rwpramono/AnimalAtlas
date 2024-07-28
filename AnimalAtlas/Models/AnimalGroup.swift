//
//  AnimalGroup.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Foundation

public class AnimalGroup: NSObject {
    let groupName: String
    let animalNames: [String]
    
    init(groupName: String, animalNames: [String]) {
        self.groupName = groupName
        self.animalNames = animalNames
    }
}
