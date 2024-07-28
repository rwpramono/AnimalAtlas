//
//  AnimalPhotoTableViewCell.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Combine
import Foundation
import UIKit

class AnimalPhotoTableViewCell: UITableViewCell {
    static let reuseIdentifier = "AnimalPhotoTableViewCell"
    
    var loveTapPublishers = PassthroughSubject<FavoriteAnimalPhoto, Never>()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AnimalPhotoViewCell.self, forCellWithReuseIdentifier: AnimalPhotoViewCell.identifier)
        return collectionView
    }()
    
    private var photos: AnimalGroupPhoto?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with photos: AnimalGroupPhoto?) {
        self.photos = photos
        collectionView.reloadData()
    }
}

extension AnimalPhotoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.animalPhotos.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimalPhotoViewCell.identifier, for: indexPath) as? AnimalPhotoViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: photos?.animalPhotos[indexPath.item], animalName: photos?.animalName)
        cell.loveTapPublishers = loveTapPublishers
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
}
