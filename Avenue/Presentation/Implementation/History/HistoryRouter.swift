//
//  HistoryRouter.swift
//  Avenue
//
//  Created by Andrew Chupin on 24.05.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya

func createConstactsScreen() -> HistoryViewController {
    let contactsViewController = HistoryViewController(nibName: HistoryViewController.identification, bundle: nil)
    contactsViewController.reducer = HistoryViewModel(contactsInteractor:
        HistoryInteractorDefault(
            contactsService: HistoryWebService(
                networkProvider: MoyaProvider<HistoryTarget>()
            ),
            contactsRepository: ContactCoreRepository(),
            settingsRepository: SettingsRepositoryDefault(defaults: UserDefaults()) // TODO add label
        )
    )
    return contactsViewController
}

