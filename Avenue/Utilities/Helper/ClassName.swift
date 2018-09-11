//
//  ClassName.swift
//  Avenue
//
//  Created by Andrew Chupin on 10.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

protocol ClassName {
    
    static var className: String { get }
    var className: String { get }
}

extension ClassName {
    
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
