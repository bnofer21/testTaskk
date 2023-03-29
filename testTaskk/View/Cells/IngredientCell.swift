//
//  IngredientCell.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

final class IngredientCell: UITableViewCell {
    
    static let id = String(describing: IngredientCell.self)

    let ingredientLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.getFont(weight: .bold, size: 11)
        label.textColor = UIColor(red: 0.153, green: 0.365, blue: 0.443, alpha: 1)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0,
                                                                     left: 0,
                                                                     bottom: 7,
                                                                     right: 0))
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor(red: 0.153,
                                                green: 0.365,
                                                blue: 0.443,
                                                alpha: 1).cgColor
        setupView()
    }

    private func setupView() {
        ingredientLabel.frame = CGRect(x: 16,
                                       y: Int(contentView.center.y),
                                       width: Int(contentView.bounds.width)/2,
                                       height: 15)
        ingredientLabel.center.y = contentView.center.y
        contentView.addSubview(ingredientLabel)
        selectionStyle = .none
    }

}
