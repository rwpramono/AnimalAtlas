//
//  AnimalItemViewCell.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Combine
import Foundation
import UIKit

final class AnimalItemViewCell: UITableViewCell {
    private var data: AnimalResponseElement?
    
    let cellTapPublishers = PassthroughSubject<AnimalResponseElement, Never>()
    let likeTapPublishers = PassthroughSubject<String, Never>()

    let contentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 4
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentContainer.layer.shadowPath = UIBezierPath(
            roundedRect: contentContainer.bounds,
            cornerRadius: contentContainer.layer.cornerRadius
        ).cgPath
    }
    
    private func setupContentContainer() {
        contentView.addSubview(contentContainer)
        
        NSLayoutConstraint.activate([
            contentContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contentContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            contentContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        contentView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func likeLabelTapped() {
        guard let data else { return }
        likeTapPublishers.send(data.name)
    }

    @objc private func cellTapped() {
        guard let data else { return }
        cellTapPublishers.send(data)
    }

    func configure(with data: AnimalResponseElement) {
        self.data = data
    }
}
