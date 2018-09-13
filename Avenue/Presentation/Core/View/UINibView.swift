//
//  BaseView.swift
//  Avenue
//
//  Created by Andrew Chupin on 10.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit

class UINibView: UIView {
    
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
        Bundle(for: type(of: self)).loadNibNamed(nibName, owner: self, options: nil)
        view.frame = bounds
        addSubview(view)
    }
}

