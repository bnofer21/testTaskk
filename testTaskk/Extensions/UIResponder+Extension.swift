//
//  UIResponder+Extension.swift
//  testTaskk
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

extension UIResponder {
    static weak var responder: UIResponder?

    static func currentFirst() -> UIResponder? {
        responder = nil
        UIApplication.shared.sendAction(#selector(trap), to: nil, from: nil, for: nil)
        return responder
    }

    @objc private func trap() {
        UIResponder.responder = self
    }
}
