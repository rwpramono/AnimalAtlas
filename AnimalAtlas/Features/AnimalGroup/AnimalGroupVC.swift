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
    private var viewModel: AnimalGroupVM
    private lazy var contentView = AnimalGroupContentView()

    fileprivate var cancellables = Set<AnyCancellable>()

    init(viewModel: AnimalGroupVM) {
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
        navigationItem.title = "Animal Group"

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
