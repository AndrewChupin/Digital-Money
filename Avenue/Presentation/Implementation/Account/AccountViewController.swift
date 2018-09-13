//
//  AccountViewController.swift
//  Avenue
//
//  Created by Andrew Chupin on 10.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var accountView: AccountTitleView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scroll: UIScrollView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func initUi() {
        scroll.contentInset = UIEdgeInsetsMake(20, 0, 20, 0)
        addCategories()
    }
    
    private func addCategories() {
        let catigoriess = initCategories()
        for category in catigoriess {
            self.stackView.addArrangedSubview(category)
        }
    }
    
    private func initCategories() -> [UIView] {
        var views: [UIView] = []
        
        // History category
        let historyCategory = CategoryView()
        historyCategory.setup(image: #imageLiteral(resourceName: "history"), label: "payment_history".localized)
        views.append(historyCategory)
        
        return views
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
