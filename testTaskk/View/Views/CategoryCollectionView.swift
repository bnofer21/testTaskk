//
//  CategoryCollectionView.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

final class CategoryCollectionView: UICollectionView {
    
    var viewModel: MainViewModelProtocol? {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setDelegates()
        registerCells()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegates() {
        delegate = self
        dataSource = self
    }
    
    private func registerCells() {
        register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.id)
        register(NewCategoryCell.self, forCellWithReuseIdentifier: NewCategoryCell.id)
    }
    
    private func setupView() {
        showsHorizontalScrollIndicator = false
    }
}

extension CategoryCollectionView: UICollectionViewDelegate,
                                  UICollectionViewDataSource,
                                  UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return .zero }
        return section == 0 ? viewModel.categories.count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.id, for: indexPath) as? CategoryCell else {
                return UICollectionViewCell()
            }
            cell.categoryLabel.text = viewModel?.categories[indexPath.row]
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCategoryCell.id, for: indexPath) as? NewCategoryCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch indexPath.section {
        case 0:
            guard let text = viewModel?.categories[indexPath.row] else { return .zero }
            let textSize = text.size(withAttributes: [.font : Fonts.getFont(weight: .bold, size: 11)])
            return CGSize(width: textSize.width + 20, height: collectionView.bounds.height)
        case 1:
            return CGSize(width: 112.32, height: 24)
        default:
            return .zero
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        section == 1 ? UIEdgeInsets(top: 0, left: 4.08, bottom: 0, right: 0) : .zero
    }
    
}


