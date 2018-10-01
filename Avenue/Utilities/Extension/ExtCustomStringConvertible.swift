//
//  File.swift
//  Avenue
//
//  Created by Andrew Chupin on 01/10/2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

extension CustomStringConvertible {
    var description : String {
        var description: String = ""
        description = "\(type(of: self))"
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children {
            if let propertyName = child.label {
                description += " | \(propertyName): \(child.value)"
            }
        }
        return description
    }
}
