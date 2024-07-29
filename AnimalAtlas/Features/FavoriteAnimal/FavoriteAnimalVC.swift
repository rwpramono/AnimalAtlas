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
        contentView.collectionView.dataSource = self
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

extension FavoriteAnimalVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.favoriteData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageWithLabelViewCell", for: indexPath) as! ImageWithLabelViewCell
        guard let image = viewModel.favoriteData?[indexPath.item].photoStringURL,
              let title = viewModel.favoriteData?[indexPath.item].name else {
            return UICollectionViewCell()
        }
        cell.configure(with: title)
        cell.loadImage(with: image, apiClient: viewModel.networkService)
        return cell
    }
}
