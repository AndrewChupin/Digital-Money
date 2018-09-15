//
//  AuthInteractor.swift
//  Avenue
//
//  Created by Andrew Chupin on 13.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

protocol AuthInteractor {
    func signIn() -> Single<Account>
}

final class AuthInteractorDefault {
    let authService: AuthService
    let settingsRepository: SettingsRepository
    
    init(authService: AuthService, settingsRepository: SettingsRepository) {
        self.authService = authService
        self.settingsRepository = settingsRepository
    }
}

extension AuthInteractorDefault: AuthInteractor {
    func signIn() -> Single<Account> {
        let request = AuthRequest(authToken: settingsRepository.authToken)
        return authService.signIn(request: request) // TOOD CHANGE TOKEN
    }
}
