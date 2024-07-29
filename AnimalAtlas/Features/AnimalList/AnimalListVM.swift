//
//  AnimalListVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Combine
import Foundation

final class AnimalListVM: ObservableObject {
    let initialAnimalListData = AnimalListFactory.initialAnimalListData
    
    private let networkService: HttpNetwork
    private var cancellables = Set<AnyCancellable>()

    @Published var errorMessage: String = ""
    
    var animalGroupName: [String: [String]] = [:]
    
    init(networkService: HttpNetwork) {
        self.networkService = networkService
    }
    
    func getAnimalGroup(by animalName: String) {
        let getAnimalAPI = AnimalAPICollections.getAnimal(by: animalName)
        networkService.execute(getAnimalAPI)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let failure) = completion {
                        self?.errorMessage = failure.localizedDescription
                    }
                },
                receiveValue: { [weak self] (resultData: AnimalResponse) in
                    self?.animalGroupName[animalName] = resultData.map { $0.name }
                }
            ).store(in: &cancellables)
    }    
}
