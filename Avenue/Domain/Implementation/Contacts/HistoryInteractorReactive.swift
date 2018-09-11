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
    func findHistory() -> Single<[Contact]>
}

final class HistoryInteractorDefault {
    private let contactsService: HistoryService
    private let contactsRepository: HistoryRepository
    private let settingsRepository: SettingsRepository
    
    init(contactsService: HistoryService, contactsRepository: HistoryRepository, settingsRepository: SettingsRepository) {
        self.contactsService = contactsService
        self.contactsRepository = contactsRepository
        self.settingsRepository = settingsRepository
    }
}

extension HistoryInteractorDefault: HistoryInteractor {
    func findHistory() -> Single<[Contact]> {
        let constactsToken = settingsRepository.constactsStateToken
        return contactsService.getHistory(request: ContactRequest(token: constactsToken)) // TOOD CHANGE TOKEN
    }
}
