//
//  MainButton.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import UIKit
/*
 <color name="colorPrimary">#384055</color>
 <color name="colorPrimaryDark">#2D3648</color>
 <color name="colorAccent">#8093CC</color>
 */

class MainButton: UINibView {
    
    @IBOutlet weak var buttonSignIn: UIButton!
    
    var onClick: () -> Void = {}
    
    override func initView() {
        super.initView()
        initTextColor()
        buttonSignIn.setTitle("sign_in".localized.uppercased(), for: .normal)
    }
    
    @IBAction func clickSignIn(_ sender: Any) {
        UIView.animate(withDuration: 3.0, animations: {
            self.view.layer.shadowRadius = 3.0
            self.view.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        })
        onClick()
    }
    
    @IBAction func buttonTouch(_ sender: Any) {
        UIView.animate(withDuration: 3.0, animations: {
            self.view.layer.shadowRadius = 6.0
            self.view.layer.shadowOffset = CGSize.init(width: 0, height: 6)
        })
    }
    
    private func initTextColor() {
        buttonSignIn.setTitleColor(UIColor.white, for: .normal)
        buttonSignIn.setTitleColor(UIColor.white, for: .highlighted)
        buttonSignIn.setTitleColor(UIColor.white, for: .selected)
    }
}
