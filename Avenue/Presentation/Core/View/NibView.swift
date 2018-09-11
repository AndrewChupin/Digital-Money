//
//  BaseView.swift
//  Avenue
//
//  Created by Andrew Chupin on 10.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit

class NibView: UIView {
    
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initView()
    }
    
    var nibName: String {
        return className
    }
    
    func initView() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        view.frame = bounds
        addSubview(view)
    }
}

