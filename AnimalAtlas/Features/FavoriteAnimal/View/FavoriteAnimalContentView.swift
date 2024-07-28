//
//  FavoriteAnimalContentView.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 27/07/24.
//

import Foundation
import UIKit

final class FavoriteAnimalContentView: UIView {
    private var images: [FavoriteAnimalPhoto] = []
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageWithLabelViewCell.self, forCellWithReuseIdentifier: "ImageWithLabelViewCell")
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(images: [FavoriteAnimalPhoto]) {
        self.images = images
        self.collectionView.reloadData()
    }
}

extension FavoriteAnimalContentView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageWithLabelViewCell", for: indexPath) as! ImageWithLabelViewCell
        let image = images[indexPath.item].photoStringURL
        let title = images[indexPath.item].name
        cell.configure(with: UIImage(named: "Animal-Slide-4")!, title: title)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }

}
