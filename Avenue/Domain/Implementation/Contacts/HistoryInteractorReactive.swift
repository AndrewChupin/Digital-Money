//
//  WelcomeInteractor.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

protocol HistoryInteractor {
    func findHistory() -> Single<[History]>
}

final class HistoryInteractorDefault {
    private let historyService: HistoryService
    private let historyRepository: HistoryRepository
    private let settingsRepository: SettingsRepository
    
    init(historyService: HistoryService, historyRepository: HistoryRepository, settingsRepository: SettingsRepository) {
        self.historyService = historyService
        self.historyRepository = historyRepository
        self.settingsRepository = settingsRepository
    }
}

extension HistoryInteractorDefault: HistoryInteractor {
    func findHistory() -> Single<[History]> {
        let constactsToken = settingsRepository.constactsStateToken
        return historyService.getHistory(request: HistoryRequest(token: constactsToken)) // TOOD CHANGE TOKEN
    }
}
