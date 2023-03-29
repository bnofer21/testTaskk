//
//  GrayButton.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

final class GrayButton: AnimatedButton {
    private let lineLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        updateLayout()
    }
    
    private func updateLayout() {
        lineLayer.frame = CGRect(x: 0,
                                 y: bounds.maxY,
                                 width: bounds.width,
                                 height: 1)
    }
    
    private func setupView() {
        setTitleColor(UIColor(red: 0.496,
                              green: 0.486,
                              blue: 0.486,
                              alpha: 1), for: .normal)
        lineLayer.backgroundColor = UIColor.gray.cgColor
        layer.addSublayer(lineLayer)
    }
}
