//
//  AnimalListContentView.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation
import UIKit

final class AnimalListContentView: UIView {
    private var images: [String] = []
    private var onTapImage: ((String) -> Void)?
    private var onTapLoveIcon: (() -> Void)?

    private let loveIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "heart.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return imageView
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .gray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),

            pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -24),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loveIcon.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 76),
            loveIcon.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -32),
            loveIcon.widthAnchor.constraint(equalToConstant: 56),
            loveIcon.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(loveIconTapped))
        loveIcon.addGestureRecognizer(tapGesture)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AnimalItemViewCell.self, forCellWithReuseIdentifier: AnimalItemViewCell.identifier)

        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(loveIcon)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with images: [String], 
                   onTapImage: ((String) -> Void)?,
                   onTapLoveIcon: (() -> Void)?) {
        self.images = images
        self.onTapImage = onTapImage
        self.onTapLoveIcon = onTapLoveIcon
        pageControl.numberOfPages = images.count
        collectionView.reloadData()
    }
    
    @objc private func loveIconTapped() {
        onTapLoveIcon?()
    }
}

extension AnimalListContentView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimalItemViewCell.identifier, for: indexPath) as! AnimalItemViewCell
        cell.configure(with: images[indexPath.row], "Animal-Slide-\(indexPath.row + 1)")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = pageIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onTapImage?(images[indexPath.row])
    }
}
