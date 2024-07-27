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
        let favoriteButton = UIBarButtonItem(
            image: UIImage(systemName: "heart.circle")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(favoriteButtonTapped)
        )
        navigationItem.rightBarButtonItem = favoriteButton
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Animal Atlas"

        configureDataSource()
        configureDataBinding()
        
//        viewModel.getAllPostsData()
    }
    
    private func configureDataSource() {
        contentView.tableView.dataSource = self
    }
    
    private func configureDataBinding() {
        viewModel.$data
            .compactMap { $0 }
            .first(where: { !$0.isEmpty })
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.contentView.tableView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .dropFirst()
            .first(where: { !$0.isEmpty })
            .receive(on: DispatchQueue.main)
            .sink { [weak self] errorMessage in
                self?.title = "API Gateway Error: \(errorMessage)"
            }
            .store(in: &cancellables)

    }
    
    @objc private func favoriteButtonTapped() {
        
    }
}

extension AnimalListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalItemViewCell", for: indexPath) as? AnimalItemViewCell,
              let data = viewModel.data?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configure(with: data)
        cell.cellTapPublishers
            .sink { [weak self] _ in
                
            }
            .store(in: &cancellables)
        
        cell.likeTapPublishers
            .sink { [weak self] _ in
                
            }
            .store(in: &cancellables)
        return cell
    }
    
    func navigateToDetail() {
        
    }
}
