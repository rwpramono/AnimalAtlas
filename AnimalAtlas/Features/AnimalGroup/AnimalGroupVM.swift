//
//  AnimalGroupVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Combine
import Foundation

final class AnimalGroupVM: ObservableObject {
    private let animalGroupName: String?
    private let networkService: HttpNetwork

    private var cancellables = Set<AnyCancellable>()

    @Published var errorMessage: String = ""
    @Published var data: AnimalResponse?

    init(animalGroupName: String,
         networkService: HttpNetwork) {
        self.animalGroupName = animalGroupName
        self.networkService = networkService
    }

    func getAllAnimalGroup() {
        guard let animalGroupName else { return }
        let api = AnimalAPICollections.getAnimal(by: animalGroupName)
        networkService.execute(api)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let failure) = completion {
                        self?.errorMessage = failure.localizedDescription
                    }
                },
                receiveValue: { [weak self] (resultData: AnimalResponse) in
                    self?.data = resultData
                }
            ).store(in: &cancellables)
    }
}
