//
//  Optional.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

extension Optional {
    func `let`(_ execution: (Wrapped!) -> Void) {
        if self != nil {
            execution(self!)
        }
    }
}
