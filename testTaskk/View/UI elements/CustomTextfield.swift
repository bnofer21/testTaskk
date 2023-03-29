//
//  CustomTextfield.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

final class CustomTextfield: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor(red: 0.153,
                                    green: 0.365,
                                    blue: 0.443,
                                    alpha: 1).cgColor
        
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        leftViewMode = .always
        rightViewMode = .always
    }
}
