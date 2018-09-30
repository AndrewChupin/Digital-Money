//
//  ExtViewController.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit

fileprivate class KeyboardAssociatedItem: NSObject {
    var constraint: NSLayoutConstraint = NSLayoutConstraint()
    var originalValue: CGFloat = 0
    var diffValue: CGFloat = 0
    var useKeyboardHeight: Bool = true
    var showBlock: ((CGFloat) -> Void)?
    var hideBlock: (() -> Void)?
}

protocol KeyboardEventsProtocol: class {
    func registerKeyBoardEvents(constraint: NSLayoutConstraint,
                                diffValue: CGFloat,
                                useKeyboardHeight: Bool,
                                showBlock: ((CGFloat) -> Void)?,
                                hideBlock: (() -> Void)?)
    func unregisterKeyboardEvents()
}

private var AssociatedItemKey: UInt8 = 0

extension UIViewController: KeyboardEventsProtocol {
    
    fileprivate var associatedItem: KeyboardAssociatedItem {
        get {
            return associatedObject(base: self, key: &AssociatedItemKey) { return KeyboardAssociatedItem() }
        }
        set {
            associateObject(base: self, key: &AssociatedItemKey, value: newValue as KeyboardAssociatedItem)
        }
    }
    
    func registerKeyBoardEvents(constraint: NSLayoutConstraint, diffValue: CGFloat = 0, useKeyboardHeight: Bool = true, showBlock: ((CGFloat) -> Void)? = nil, hideBlock: (() -> Void)? = nil) {
        let item = KeyboardAssociatedItem()
        item.constraint = constraint
        item.originalValue = constraint.constant
        item.diffValue = diffValue
        item.useKeyboardHeight = useKeyboardHeight
        item.showBlock = showBlock
        item.hideBlock = hideBlock
        self.associatedItem = item
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    func unregisterKeyboardEvents() {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardSize = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
            let animateDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber
            else { return }
        
        let item = self.associatedItem
        if item.useKeyboardHeight {
            item.constraint.constant = keyboardSize.size.height - item.diffValue
        } else {
            item.constraint.constant = item.diffValue
        }
        item.showBlock?(keyboardSize.height)
        UIView.animate(withDuration: animateDuration.doubleValue, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        guard
            let userInfo = notification.userInfo,
            let _ = userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect,
            let animateDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber
            else { return }
        
        let item = self.associatedItem
        item.constraint.constant = item.originalValue
        item.hideBlock?()
        UIView.animate(withDuration: animateDuration.doubleValue, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addChildViewController(_ viewController: UIViewController, containerView: UIView) {
        addChildViewController(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }
    
    func removeChildViewController(_ viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    
     static func viewName() -> String {
        return className.replacingOccurrences(of: "Controller", with: "")
    }
}
