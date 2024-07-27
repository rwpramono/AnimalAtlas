//
//  AnimalItemViewCell.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Combine
import Foundation
import UIKit

final class AnimalItemViewCell: UICollectionViewCell {
    static let identifier = "AnimalItemViewCell"

    private var data: AnimalResponse?
    
    let cellTapPublishers = PassthroughSubject<AnimalResponseElement, Never>()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 72, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -72),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
        ])
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = contentView.bounds
        gradientLayer.colors = [
            UIColor.black.withAlphaComponent(0.35).cgColor,
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.35).cgColor
        ]
        gradientLayer.locations = [0.3, 0.6]
        imageView.layer.addSublayer(gradientLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with animalName: String, _ imageName: String) {
        imageView.image = UIImage(named: imageName)
        titleLabel.text = animalName
    }
}

