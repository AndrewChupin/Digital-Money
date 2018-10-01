//
//  AccountRouter.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import UIKit

func createAccountScreen() -> UIViewController {
    return AccountViewController(name: AccountViewController.viewName(), reducer: AccountViewModel())
}
