//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

protocol ContactsUseCase: class {
    func findContacts() -> Single<[Contact]>
}
