//
//  WelcomeInteractor.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

protocol ContactsInteractor {
    func findContacts() -> Single<[Contact]>
}

final class ContactsInteractorDefault {
    private let contactsService: ContactsService
    private let contactsRepository: ContactsRepository
    private let settingsRepository: SettingsRepository
    
    init(contactsService: ContactsService, contactsRepository: ContactsRepository, settingsRepository: SettingsRepository) {
        self.contactsService = contactsService
        self.contactsRepository = contactsRepository
        self.settingsRepository = settingsRepository
    }
}

extension ContactsInteractorDefault: ContactsInteractor {
    func findContacts() -> Single<[Contact]> {
        let constactsToken = settingsRepository.constactsStateToken
        return contactsService.getContacts(request: ContactRequest(token: constactsToken)) // TOOD CHANGE TOKEN
    }
}
