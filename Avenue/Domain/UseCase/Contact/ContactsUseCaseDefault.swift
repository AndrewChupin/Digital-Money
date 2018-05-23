//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

class ContactsUseCaseDefault {
    let contactsService: ContactsService
    let contactsRepository: ContactsRepository
    let settingsRepository: SettingsRepository

    init(contactsService: ContactsService, contactsRepository: ContactsRepository, settingsRepository: SettingsRepository) {
        self.contactsService = contactsService
        self.contactsRepository = contactsRepository
        self.settingsRepository = settingsRepository
    }
}

extension ContactsUseCaseDefault: ContactsUseCase {
    func findContacts() -> Single<[Contact]> {
        let constactsToken = settingsRepository.constactsStateToken
        return contactsService.getContacts(request: ContactRequest(token: constactsToken)) // TOOD CHANGE TOKEN
    }
}
