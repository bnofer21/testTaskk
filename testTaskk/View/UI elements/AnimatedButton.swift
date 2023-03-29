//
//  AnimatedButton.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

class AnimatedButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            tapAnimation()
        }
    }
    
    private func tapAnimation() {
        UIView.animate(withDuration: 0.15, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
            self.alpha = self.isHighlighted ? 0.2 : 1
        }, completion: nil)
    }
}
