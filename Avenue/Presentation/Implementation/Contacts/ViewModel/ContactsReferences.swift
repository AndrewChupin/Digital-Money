//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxCocoa

protocol ContactsReference: BaseReference {
    
    // Public
    var contacts: Driver<[Contact]> { get }

    func loadUsers()
    
}
