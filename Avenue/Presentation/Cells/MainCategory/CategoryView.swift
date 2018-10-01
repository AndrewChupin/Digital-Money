//
//  CategoryView.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CategoryView: UINibView {
    @IBOutlet weak var imageCategory: UIImageView!
    @IBOutlet weak var labelCategory: UILabel!
    var onClick: (() -> Void)? = nil
    
    func setup(image: UIImage, label: String) {
        imageCategory.image = image
        labelCategory.text = label
    }
    
    @IBAction func categoryClick(_ sender: Any) {
        onClick?()
    }
}
