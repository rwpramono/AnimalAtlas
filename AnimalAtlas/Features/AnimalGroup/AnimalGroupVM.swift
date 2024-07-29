//
//  AnimalGroupVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Combine
import Foundation

final class AnimalGroupVM<T: DataPersistence>: ObservableObject where T.T == FavoriteAnimalPhoto {
    private let animalNames: AnimalGroup
    private let networkService: HttpNetwork
    private let dataPersistence: T

    private var cancellables = Set<AnyCancellable>()

    @Published var errorMessage: String = ""
    @Published var data: [AnimalGroupPhoto]? = []

    let imageLoaderService: HttpNetwork
    
    init(animalNames: AnimalGroup,
         networkService: HttpNetwork,
         imageLoaderService: HttpNetwork,
         dataPersistence: T) {
        self.animalNames = animalNames
        self.networkService = networkService
        self.dataPersistence = dataPersistence
        self.imageLoaderService = imageLoaderService
    }

    func getAnimalGroupTitle() -> String {
        animalNames.groupName
    }
    
    func getAllAnimalPhoto() {
        let animalPhotoCounter = data?.count ?? 0
        guard animalPhotoCounter != animalNames.animalNames.count else {
            self.errorMessage = HttpNetworkError.other(message: "No more animal data").localizedDescription
            return
        }
        let animalName = animalNames.animalNames[animalPhotoCounter]
        let searchPhotoAnimalAPI = AnimalAPICollections.searchAnimalPhoto(
            by: animalName
        )
        networkService.execute(searchPhotoAnimalAPI)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let failure) = completion {
                        self?.errorMessage = failure.localizedDescription
                    }
                },
                receiveValue: { [weak self] (resultData: SearchPhotoResponse) in
                    self?.errorMessage = ""
                    self?.data?.append(
                        AnimalGroupPhoto(animalName: animalName, animalPhotos: resultData.photos)
                    )
                    self?.getAllAnimalPhoto()
                }
            ).store(in: &cancellables)
    }
    
    func toggleFavoritePhoto(_ photo: FavoriteAnimalPhoto) {
        do {
            try dataPersistence.delete(photo)
        }
        catch DataPersistenceError.deleteFailed(DataPersistenceError.predicateDataNotFound) {
            do {
                try dataPersistence.add(photo)
            }
            catch {
                errorMessage = DataPersistenceError.saveFailed(error).localizedDescription
            }
        }
        catch {
            errorMessage = DataPersistenceError.deleteFailed(error).localizedDescription
        }
    }
}
