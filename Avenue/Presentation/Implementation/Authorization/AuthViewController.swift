//
//  AuthViewController.swift
//  Avenue
//
//  Created by Andrew Chupin on 12.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var fieldPhone: UITextField!
    @IBOutlet weak var bottomConstaint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var middleConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        //registerKeyBoardEvents(constraint: bottomConstaint)
    }
    
    override func keyboardWillShow(notification: NSNotification) {
        super.keyboardWillShow(notification: notification)
        //topConstraint.constant = 16.0
        //middleConstraint.constant = 16.0
    }
    
    override func keyboardWillHide(notification: NSNotification) {
        super.keyboardWillHide(notification: notification)
        //topConstraint.constant = 150.0
        //middleConstraint.constant = 135.5
    }
}
