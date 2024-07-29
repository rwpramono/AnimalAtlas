//
//  FavoriteAnimalFactory.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

final class FavoriteAnimalFactory {
    static func makeFavoriteAnimalVC() -> FavoriteAnimalVC {
        let vm = FavoriteAnimalVM(
            networkService: DependencyContainer.shared.imageLoaderService,
            dataPersistence: FavoriteAnimalPersistenceService(
                coreDataStack: DependencyContainer.shared.coreDataStack
            )
        )
        return FavoriteAnimalVC(viewModel: vm)
    }
}
