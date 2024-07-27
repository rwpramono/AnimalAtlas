//
//  FavoriteAnimalVC.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Combine
import Foundation
import UIKit

final class FavoriteAnimalVC: UIViewController {
    private var viewModel: FavoriteAnimalVM
    private lazy var contentView = FavoriteAnimalContentView()

    fileprivate var cancellables = Set<AnyCancellable>()

    init(viewModel: FavoriteAnimalVM) {
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
        navigationItem.title = "Favorite Animal"

        configureDataSource()
        configureDataBinding()
    }
    
    private func configureDataSource() {

    }
    
    private func configureDataBinding() {
//        viewModel.$data
//            .compactMap { $0 }
//            .first(where: { !$0.isEmpty })
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] _ in
//                self?.contentView.tableView.reloadData()
//            }
//            .store(in: &cancellables)
//
//        viewModel.$errorMessage
//            .dropFirst()
//            .first(where: { !$0.isEmpty })
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] errorMessage in
//                self?.title = "API Gateway Error: \(errorMessage)"
//            }
//            .store(in: &cancellables)

    }
    
    @objc private func favoriteButtonTapped() {
        
    }
}
