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
    private var viewModel: FavoriteAnimalVM<FavoriteAnimalPersistenceService>
    private lazy var contentView = FavoriteAnimalContentView()
    
    fileprivate var cancellables = Set<AnyCancellable>()
    
    init(viewModel: FavoriteAnimalVM<FavoriteAnimalPersistenceService>) {
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
        navigationItem.title = "Favorite Animal"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupFilterNavItem()
        configureDataSource()
        configureDataBinding()
        
        viewModel.getFavoritePhoto()
    }
    
    private func configureDataSource() {
        
    }
    
    private func configureDataBinding() {
        viewModel.$favoriteData
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                self?.contentView.configure(images: data)
            }
            .store(in: &cancellables)
    }
    
    private func setupFilterNavItem() {
        let handler: (_ action: UIAction) -> () = { [weak self] action in
            self?.viewModel.filterData(by: action.identifier.rawValue)
        }
        
        let actions = AnimalListFactory.initialAnimalListData.map {
            UIAction(title: $0, identifier: .init($0), handler: handler)
        }
        
        let menu = UIMenu(title: "Filter by Animal Group",  children: actions)
        let rightBarButton = UIBarButtonItem(
            title: "",
            image: UIImage(systemName: "line.3.horizontal.decrease.circle.fill"),
            menu: menu)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
}
