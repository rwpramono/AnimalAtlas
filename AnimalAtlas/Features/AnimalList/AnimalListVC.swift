//
//  AnimalListVC.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Combine
import Foundation
import UIKit

final class AnimalListVC: UIViewController {
    private var viewModel: AnimalListVM
    private lazy var contentView = AnimalListContentView()

    fileprivate var cancellables = Set<AnyCancellable>()

    init(viewModel: AnimalListVM) {
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
        configureDataSource()
        configureDataBinding()
        
//        viewModel.getAllPostsData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)

    }
    
    private func configureDataSource() {
        contentView.configure(
            with: viewModel.initialAnimalListData,
            onTapImage: { [weak self] selectedAnimalName in
                self?.animalImageTapped(with: selectedAnimalName)
            },
            onTapLoveIcon: { [weak self] in
                self?.favoriteButtonTapped()
            }
        )
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
        let vc = FavoriteAnimalFactory.makeFavoriteAnimalVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func animalImageTapped(with name: String) {
        let vc = AnimalGroupFactory.makeAnimalGroupVC(name)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//extension AnimalListVC: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.data?.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalItemViewCell", for: indexPath) as? AnimalItemViewCell,
//              let data = viewModel.data?[indexPath.row] else {
//            return UITableViewCell()
//        }
//        
//        cell.configure(with: data)
//        cell.cellTapPublishers
//            .sink { [weak self] _ in
//                
//            }
//            .store(in: &cancellables)
//        
//        cell.likeTapPublishers
//            .sink { [weak self] _ in
//                
//            }
//            .store(in: &cancellables)
//        return cell
//    }
//    
//    func navigateToDetail() {
//        
//    }
//}
