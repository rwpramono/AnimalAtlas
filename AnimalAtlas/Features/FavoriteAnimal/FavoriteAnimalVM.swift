//
//  FavoriteAnimalVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation

final class FavoriteAnimalVM<T: DataPersistence>: ObservableObject where T.T == FavoriteAnimalPhoto {
    private let dataPersistence: T
    
    @Published var errorMessage: String = ""
    @Published var favoriteData: [FavoriteAnimalPhoto]?
    
    init(dataPersistence: T) {
        self.dataPersistence = dataPersistence
    }

    func getFavoritePhoto() {
        do {
            favoriteData = try dataPersistence.load()
        } catch {
            errorMessage = DataPersistenceError.loadFailed(error).localizedDescription
        }
    }
    
    func filterData(by animalName: String) {
        favoriteData = try? dataPersistence.load().filter {
            $0.name.contains(animalName)
        }
    }
}
