//
//  AnimalGroupVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Combine
import Foundation

final class AnimalGroupVM: ObservableObject {
    private let animalNames: AnimalGroup
    private let networkService: HttpNetwork
    
    private var cancellables = Set<AnyCancellable>()

    @Published var errorMessage: String = ""
    @Published var data: [AnimalGroupPhoto]? = []

    init(animalNames: AnimalGroup,
         networkService: HttpNetwork) {
        self.animalNames = animalNames
        self.networkService = networkService
    }

    func getAnimalGroupTitle() -> String {
        animalNames.groupName
    }
    
    func getAllAnimalPhoto() {
        let animalPhotoCounter = data?.count ?? 0
        guard animalPhotoCounter != animalNames.animalNames.count else { return }
        let animalName = animalNames.animalNames[animalPhotoCounter]
        let searchPhotoAnimalAPI = AnimalAPICollections.searchAnimalPhoto(
            by: animalName
        )
        networkService.execute(searchPhotoAnimalAPI)
            .delay(for: .seconds(5), scheduler: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let failure) = completion {
                        self?.errorMessage = failure.localizedDescription
                    }
                },
                receiveValue: { [weak self] (resultData: SearchPhotoResponse) in
                    self?.data?.append(
                        AnimalGroupPhoto(animalName: animalName, animalPhotos: resultData.photos)
                    )
                    self?.getAllAnimalPhoto()
                }
            ).store(in: &cancellables)
    }
}
