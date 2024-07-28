//
//  AnimalGroupContentView.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 28/07/24.
//

import Combine
import Foundation
import UIKit

final class AnimalGroupContentView: UIView {
    private var animalPhoto: [AnimalGroupPhoto]?

    var loveTapPublishers = PassthroughSubject<FavoriteAnimalPhoto, Never>()

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AnimalPhotoTableViewCell.self, forCellReuseIdentifier: AnimalPhotoTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(tableView)
        addSubview(activityIndicator)
        tableView.delegate = self
        tableView.dataSource = self
        
        activityIndicator.startAnimating()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    public func configure(_ photo: [AnimalGroupPhoto]) {
        animalPhoto = photo
        tableView.reloadData()
    }
    
    public func stopIndicator() {
        activityIndicator.stopAnimating()
    }
}

extension AnimalGroupContentView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalPhoto?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnimalPhotoTableViewCell.reuseIdentifier, for: indexPath) as? AnimalPhotoTableViewCell else {
            return UITableViewCell()
        }
        let sectionData = animalPhoto?[indexPath.section]
        cell.configure(with: sectionData)
        cell.loveTapPublishers = loveTapPublishers
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 16, y: 5, width: tableView.frame.width, height: 20))
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = animalPhoto?[section].animalName
        view.addSubview(label)
        return view
    }

//        onTapLoveIcon?(animalPhoto?[indexPath.row].id)
//    }
}
