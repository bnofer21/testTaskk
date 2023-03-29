//
//  UIViewController+Extension.swift
//  testTask
//
//  Created by Юрий on 29.03.2023.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func setMoveViewNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotifications), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func deleteMoveViewNotifiations() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func keyboardNotifications(notification: NSNotification) {
        
        var textFieldY : CGFloat = 0.0
        let space : CGFloat = 10.0
        
        var frame = CGRect.zero
        if let activeTextField = UIResponder.currentFirst() as? UITextField {
            frame = self.view.convert(activeTextField.frame, from:activeTextField.superview)
            textFieldY = frame.origin.y + frame.size.height
        }
        if let userInfo = notification.userInfo {
            guard let keyBoardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            let keyboardY = keyBoardFrame.origin.y
            let keyboardHeight = keyBoardFrame.size.height
            
            var viewOriginY: CGFloat = 0.0
            
            if keyboardY >= UIScreen.main.bounds.size.height {
                viewOriginY = 0.0
            } else if textFieldY >= keyboardY {
                viewOriginY = (textFieldY - keyboardY) + space
                if viewOriginY > keyboardHeight { viewOriginY = keyboardHeight }
            }
            self.view.frame.origin.y = -viewOriginY
        }
    }

}
