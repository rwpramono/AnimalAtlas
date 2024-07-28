//
//  AnimalGroupVC.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Combine
import Foundation
import UIKit

final class AnimalGroupVC: UIViewController {
    private var viewModel: AnimalGroupVM<FavoriteAnimalPersistenceService>
    private lazy var contentView = AnimalGroupContentView()

    fileprivate var cancellables = Set<AnyCancellable>()

    init(viewModel: AnimalGroupVM<FavoriteAnimalPersistenceService>) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = viewModel.getAnimalGroupTitle()

        configureDataSource()
        configureDataBinding()
        
        viewModel.getAllAnimalPhoto()
    }
    
    private func configureDataSource() {

    }
    
    private func configureDataBinding() {
        contentView.loveTapPublishers
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
            self?.viewModel.saveFavoritePhoto($0)
        }
        .store(in: &cancellables)
        
        viewModel.$data
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] animalPhoto in
                self?.contentView.configure(animalPhoto)
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .filter { !$0.isEmpty }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.contentView.stopIndicator()
            }
            .store(in: &cancellables)
    }
}
