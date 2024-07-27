//
//  AnimalGroupFactory.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

final class AnimalGroupFactory {
    static func makeAnimalGroupVC(_ name: String) -> AnimalGroupVC {
        let vm = AnimalGroupVM(animalGroupName: name)
        return AnimalGroupVC(viewModel: vm)
    }
}
