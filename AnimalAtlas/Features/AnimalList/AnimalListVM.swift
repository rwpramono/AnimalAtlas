//
//  AnimalListVM.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Combine
import Foundation

final class AnimalListVM: ObservableObject {
    private let networkService: HttpNetwork

    private var cancellables = Set<AnyCancellable>()

    @Published var errorMessage: String = ""
    @Published var data: AnimalResponse?

    init(networkService: HttpNetwork) {
        self.networkService = networkService
    }
    
    func getData() {
        // FIXME: Add query from core data
        let api = AnimalAPICollections.getAnimal(by: "")
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
    
    func likeAnAnimal(postId: Int) {
        
    }
}
