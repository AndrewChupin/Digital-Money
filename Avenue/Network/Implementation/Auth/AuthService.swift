//
//  AuthService.swift
//  Avenue
//
//  Created by Andrew Chupin on 13.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

protocol AuthService: class {
    func signIn(request: AuthRequest) -> Single<Account>
}
