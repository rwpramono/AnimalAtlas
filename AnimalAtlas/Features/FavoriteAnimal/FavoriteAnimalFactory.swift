//
//  FavoriteAnimalFactory.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

final class FavoriteAnimalFactory {
    static func makeFavoriteAnimalVC() -> FavoriteAnimalVC {
        let vm = FavoriteAnimalVM()
        return FavoriteAnimalVC(viewModel: vm)
    }
}
