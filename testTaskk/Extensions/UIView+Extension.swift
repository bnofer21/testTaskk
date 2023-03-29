//
//  UIView+Extension.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

extension UIView {
    func addView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}
