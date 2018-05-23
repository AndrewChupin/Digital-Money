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


class ContactsInteractorDefault {

    let contactsUseCase: ContactsUseCase

    init(contactsUseCase: ContactsUseCase) {
        self.contactsUseCase = contactsUseCase
    }

}

extension ContactsInteractorDefault: ContactsInteractor {

    func findContacts() -> Single<[Contact]> {
        return contactsUseCase.findContacts()
    }
    
}
