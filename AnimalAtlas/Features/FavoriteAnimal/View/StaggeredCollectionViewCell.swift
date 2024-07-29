//
//  ImageWithLabelViewCell.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Combine
import UIKit

class ImageWithLabelViewCell: UICollectionViewCell {
    private var cancellables = Set<AnyCancellable>()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    func loadImage(with imageUrlString: String, apiClient: HttpNetwork) {
        apiClient.execute(ImageAPI(.get, path: imageUrlString))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
            }, receiveValue: { [weak self] (data: DataCodable) in
                self?.imageView.image = UIImage(data: data.data)
            })
            .store(in: &cancellables)
    }
}
