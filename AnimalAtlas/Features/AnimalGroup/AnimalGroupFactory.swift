//
//  AnimalGroupFactory.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

final class AnimalGroupFactory {
    static func makeAnimalGroupVC(_ animalName: AnimalGroup) -> AnimalGroupVC {
        let vm = AnimalGroupVM(
            animalNames: animalName,
            networkService: DependencyContainer.shared.networkService, 
            imageLoaderService: DependencyContainer.shared.imageLoaderService,
            dataPersistence: FavoriteAnimalPersistenceService(
                coreDataStack: DependencyContainer.shared.coreDataStack
            )
        )
        return AnimalGroupVC(viewModel: vm)
    }
}
