//
//  AnimalGroupVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Combine
import Foundation

final class AnimalGroupVM: ObservableObject {
    private let animalNames: [String]
    private let networkService: HttpNetwork

    private var cancellables = Set<AnyCancellable>()

    @Published var errorMessage: String = ""
    @Published var data: [SearchPhotoResponse]?

    init(animalNames: [String],
         networkService: HttpNetwork) {
        self.animalNames = animalNames
        self.networkService = networkService
    }

    func getAllAnimalPhoto() {
        animalNames.forEach { [weak self] in
            self?.getSearchAnimalPhoto(by: $0)
        }
    }
    
    func getSearchAnimalPhoto(by animalName: String) {
        let searchPhotoAnimalAPI = AnimalAPICollections.searchAnimalPhoto(by: animalName)
        networkService.execute(searchPhotoAnimalAPI)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let failure) = completion {
                        self?.errorMessage = failure.localizedDescription
                    }
                },
                receiveValue: { [weak self] (resultData: SearchPhotoResponse) in
                    self?.data?.append(resultData)
                }
            ).store(in: &cancellables)
    }
}
