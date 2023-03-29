//
//  Fonts.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

enum Fonts {
    enum Weights {
        case bold, medium, regular
    }
    
    static func getFont(weight: Fonts.Weights, size: CGFloat) -> UIFont {
        switch weight {
        case .bold:
            return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size)

        case .medium:
            return UIFont(name: "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: size)

        case .regular:
            return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
}
