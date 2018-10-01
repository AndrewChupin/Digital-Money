//
//  AuthViewController.swift
//  Avenue
//
//  Created by Andrew Chupin on 12.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import UIKit

class AuthViewController: BaseViewController<AuthViewModel, AuthViewState> {
    
    @IBOutlet weak var bottomConstaint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var middleConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var fieldPhone: UITextField!
    @IBOutlet weak var mainButton: MainButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerKeyBoardEvents(constraint: bottomConstaint)
        mainButton.onClick = {
            let data = SignInData(login: self.fieldPhone.text ?? String.empty, code: String.empty)
            self.reducer?.reduce(with: .signIn(data))
        }
    }
    
    override func render(viewState: AuthViewState) {
        print("render")
        switch viewState.primaryState {
        case .succeess:
            self.navigationController?.pushViewController(createAccountScreen(), animated: true)
        case .loading:
            break
        case .common:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func keyboardWillShow(notification: NSNotification) {
        super.keyboardWillShow(notification: notification)
        topConstraint.constant = 16.0
        middleConstraint.constant = 16.0
        imageHeightConstraint.constant = 0
    }
    
    override func keyboardWillHide(notification: NSNotification) {
        super.keyboardWillHide(notification: notification)
        topConstraint.constant = 150.0
        middleConstraint.constant = 135.5
        imageHeightConstraint.constant = 90.0
    }
}
