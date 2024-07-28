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
        viewModel.initialAnimalListData.forEach { [weak self] in
            self?.viewModel.getAnimalGroup(by: $0)
        }
        
        configureDataSource()
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
                guard let animalName = self?.viewModel.animalGroupName[selectedAnimalName] else { return }
                self?.animalImageTapped(
                    with: AnimalGroup(groupName: selectedAnimalName, animalNames: animalName)
                )
            },
            onTapLoveIcon: { [weak self] in
                self?.favoriteButtonTapped()
            }
        )
    }
    
    @objc private func favoriteButtonTapped() {
        let vc = FavoriteAnimalFactory.makeFavoriteAnimalVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func animalImageTapped(with animalName: AnimalGroup) {
        let vc = AnimalGroupFactory.makeAnimalGroupVC(animalName)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
