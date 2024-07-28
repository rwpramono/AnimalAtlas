//
//  FavoriteAnimalVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

final class FavoriteAnimalVM<T: DataPersistence>: ObservableObject where T.T == FavoriteAnimalPhoto {
    private let dataPersistence: T
    
    init(dataPersistence: T) {
        self.dataPersistence = dataPersistence
    }

}
