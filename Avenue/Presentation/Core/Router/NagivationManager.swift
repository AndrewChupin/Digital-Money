//
//  Navigator.swift
//  Avenue
//
//  Created by Andrew Chupin on 13.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import UIKit

protocol Navigator {
    var navigationController: UINavigationController { get set }
    func apply(command: NavigationCommand)
}

protocol Router {
    func navigateTo(_ identification: String, withRoot: Bool)
    func backTo(identification: String)
    func exit()
}

class BaseRouter: Router {
    func backTo(identification: String) {
        
    }
    
    func navigateTo(_ identification: String, withRoot: Bool = false) {
        
    }
    
    func exit() {
        
    }
}

class UINavigator: Navigator {
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func apply(command: NavigationCommand) {
        
    }
}

class NagivationManager {
    
    static let shared = NagivationManager()
    
    let navigator: Navigator? = nil
    let router: Router = BaseRouter()
    
    private init() {}
}
