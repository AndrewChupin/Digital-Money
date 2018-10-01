//
//  AuthRouter.swift
//  Avenue
//
//  Created by Andrew Chupin on 12.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya

func createAuthScreen() -> AuthViewController {
    return AuthViewController(
        name: AuthViewController.viewName(),
        reducer: AuthViewModel(
            interactor: AuthInteractorDefault(
                authService: AuthWebService(networkProvider: MoyaProvider<AuthTarget>()),
                settingsRepository: SettingsRepositoryDefault(defaults: UserDefaults())
            )
        )
    )
}
