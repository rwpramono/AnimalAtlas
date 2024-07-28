//
//  AnimalPhotoViewCell.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 26/07/24.
//

import Combine
import Foundation
import UIKit

class AnimalPhotoViewCell: UICollectionViewCell {
    static let identifier = "AnimalPhotoViewCell"
    
    let likeTapPublishers = PassthroughSubject<Int, Never>()

    private let data: AnimalPhoto? = nil
    private let animalPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let loveIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "heart.circle")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal)
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(animalPhoto)
        contentView.addSubview(loveIcon)

        NSLayoutConstraint.activate([
            animalPhoto.topAnchor.constraint(equalTo: contentView.topAnchor),
            animalPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            animalPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            animalPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            animalPhoto.heightAnchor.constraint(equalToConstant: 180),
            animalPhoto.widthAnchor.constraint(equalToConstant: 180),

            loveIcon.heightAnchor.constraint(equalToConstant: 36),
            loveIcon.widthAnchor.constraint(equalToConstant: 36),
            loveIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            loveIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(likeLabelTapped))
        loveIcon.addGestureRecognizer(tapGesture)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: AnimalPhoto?) {
        guard let item else { return }
        animalPhoto.image = UIImage(named: "Animal-Slide-1")
    }
    
    @objc private func likeLabelTapped() {
        guard let data else { return }
        likeTapPublishers.send(data.id)
    }
}
