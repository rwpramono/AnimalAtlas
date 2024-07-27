//
//  AnimalListVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Combine
import Foundation

final class AnimalListVM: ObservableObject {
    let initialAnimalListData = ["Elephant", "Lion", "Fox", "Dog", "Shark", "Turtle", "Whale", "Penguin"]

    private var cancellables = Set<AnyCancellable>()

    @Published var errorMessage: String = ""
        
    func getData() {
        
        // FIXME: Add query from core data
//        let api = AnimalAPICollections.getAnimal(by: "")
//        networkService.execute(api)
//            .receive(on: DispatchQueue.main)
//            .sink(
//                receiveCompletion: { [weak self] completion in
//                    if case .failure(let failure) = completion {
//                        self?.errorMessage = failure.localizedDescription
//                    }
//                },
//                receiveValue: { [weak self] (resultData: AnimalResponse) in
//                    self?.data = resultData
//                }
//            ).store(in: &cancellables)
    }    
}
