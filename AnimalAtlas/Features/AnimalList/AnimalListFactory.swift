//
//  AnimalListFactory.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

final class AnimalListFactory {
    static func makeAnimalListVC() -> AnimalListVC {
        let vm = AnimalListVM()
        return AnimalListVC(viewModel: vm)
    }
}
