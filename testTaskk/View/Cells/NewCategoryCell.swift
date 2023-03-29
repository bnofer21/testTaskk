//
//  NewCategoryCell.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

final class NewCategoryCell: UICollectionViewCell {
    
    static let id = String(describing: NewCategoryCell.self)
    
    override var isSelected: Bool {
        didSet {
            tapAnimation()
        }
    }

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.255,
                                  green: 0.565,
                                  blue: 0.584,
                                  alpha: 1)
        label.font = Fonts.getFont(weight: .bold, size: 11)
        label.text = "Новый раздел"
        return label
    }()
    
    private var addLogo: UIImageView = {
       let logo = UIImageView()
        logo.image = UIImage(named: "plusLogo")
        return logo
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureContentView()
        setupView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContentView() {
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
        layer.borderColor = UIColor(red: 0.255,
                                    green: 0.565,
                                    blue: 0.584,
                                    alpha: 1).cgColor
    }

    private func setupView() {
        addView(titleLabel)
        addView(addLogo)
    }

    private func tapAnimation() {
        UIView.animate(
            withDuration: 0.15,
            delay: 0,
            options: [
                .beginFromCurrentState,
                .allowUserInteraction
            ],
            animations: { [weak self] in
                guard let self = self else { return }

                self.alpha = 0.2
            }, completion: { [weak self] _ in
                guard let self = self else { return }

                UIView.animate(withDuration: 0.15, delay: 0) {
                    self.alpha = 1
                }
            })
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11.32),

            addLogo.centerYAnchor.constraint(equalTo: centerYAnchor),
            addLogo.widthAnchor.constraint(equalToConstant: 18),
            addLogo.heightAnchor.constraint(equalToConstant: 18),
            addLogo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.67)
        ])
    }
}

