//
//  AnimalGroupVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Foundation

final class AnimalGroupVM: ObservableObject {
    private let animalGroupName: String?
    
    init(animalGroupName: String) {
        self.animalGroupName = animalGroupName
    }

}
