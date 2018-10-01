//
//  HistoryRouter.swift
//  Avenue
//
//  Created by Andrew Chupin on 24.05.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya

func createHistoryScreen() -> HistoryViewController {
    let historyViewController = HistoryViewController(
        name: HistoryViewController.viewName(),
        reducer: HistoryViewModel(
            historyInteractor: HistoryInteractorDefault(
                historyService: HistoryWebService(
                    networkProvider: MoyaProvider<HistoryTarget>()
                ),
                historyRepository: HistoryCoreRepository(),
                settingsRepository: SettingsRepositoryDefault(defaults: UserDefaults()) // TODO add label
            )
        )
    )
    return historyViewController
}

