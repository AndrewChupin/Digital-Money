//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

class ContactsUseCaseDefault {

    let contactsService: ContactsService
    let contactsRepository: ContactsRepository

    init(contactsService: ContactsService, contactsRepository: ContactsRepository) {
        self.contactsService = contactsService
        self.contactsRepository = contactsRepository
    }

}

extension ContactsUseCaseDefault: ContactsUseCase {

    func findContacts() -> Single<[Contact]> {
       return contactsService.getContacts(request: ContactRequest(token: "SOME_TOKEN")) // TOOD CHANGE TOKEN
    }

}
