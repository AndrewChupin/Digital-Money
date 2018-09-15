//
//  AuthWebService.swift
//  Avenue
//
//  Created by Andrew Chupin on 13.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class AuthWebService {
    let networkProvider: MoyaProvider<AuthTarget>
    
    init(networkProvider: MoyaProvider<AuthTarget>) {
        self.networkProvider = networkProvider;
    }
}

extension AuthWebService: AuthService {
    func signIn(request: AuthRequest) -> Single<Account> {
        return networkProvider
            .rx
            .request(.signIn(request: request), callbackQueue: DispatchQueue.global(qos: .background))
            .map(Account.self)
    }
}
