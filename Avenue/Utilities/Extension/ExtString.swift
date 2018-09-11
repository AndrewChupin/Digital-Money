//
//  String.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

extension String {
    static let empty = ""
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
