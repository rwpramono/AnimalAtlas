//
//  AnimalListFactory.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

final class AnimalListFactory {
    static let initialAnimalListData = ["Elephant", "Lion", "Fox", "Dog", "Shark", "Turtle", "Whale", "Penguin"]
    static func makeAnimalListVC() -> AnimalListVC {
        let vm = AnimalListVM(networkService: DependencyContainer.shared.networkService)
        return AnimalListVC(viewModel: vm)
    }
}
