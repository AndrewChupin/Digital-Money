//
//  ExtCALayer.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit

extension CALayer {
    
    var borderCGColor: UIColor? {
        get {
            guard let borderColor = self.borderColor else { return nil }
            return UIColor(cgColor:borderColor)
        }
        set {
            if let newValue = newValue {
                borderColor = newValue.cgColor
            }
        }
    }
    
    var shadowCGColor: UIColor? {
        get {
            guard let shadowColor = shadowColor else { return nil }
            return UIColor(cgColor: shadowColor)
        }
        set {
            if let newValue = newValue {
                shadowColor = newValue.cgColor
            }
        }
    }
    
    var backgroundCGColor: UIColor? {
        get {
            guard let shadowColor = backgroundColor else { return nil }
            return UIColor(cgColor: shadowColor)
        }
        set {
            if let newValue = newValue {
                backgroundColor = newValue.cgColor
            }
        }
    }
}
