//
//  CategoryCell.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
    
    static let id = String(describing: CategoryCell.self)

    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor(red: 0.153,
                                                   green: 0.365,
                                                   blue: 0.443,
                                                   alpha: 1) : .white
            categoryLabel.textColor = isSelected ? .white : UIColor(red: 0.153,
                                                                    green: 0.365,
                                                                    blue: 0.443,
                                                                    alpha: 1)
        }
    }

    var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getFont(weight: .bold, size: 11)
        label.textColor = UIColor(red: 0.153,
                                  green: 0.365,
                                  blue: 0.443,
                                  alpha: 1)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addView(categoryLabel)
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.borderColor = UIColor(red: 0.153,
                                    green: 0.365,
                                    blue: 0.443,
                                    alpha: 1).cgColor
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

        ])
    }
}

