//
//  ContactsRouter.swift
//  Avenue
//
//  Created by Andrew Chupin on 24.05.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya

func createConstactsScreen() -> ContactsViewController {
    let contactsViewController = ContactsViewController(nibName: ContactsViewController.identification, bundle: nil)
    contactsViewController.viewModel = ContactsViewModel(contactsInteractor:
        ContactsInteractorDefault(
            contactsUseCase: ContactsUseCaseDefault(
                contactsService: ContactsWebService(
                    networkProvider: MoyaProvider<ContactsTarget>()
                ),
                contactsRepository: ContactCoreRepository(),
                settingsRepository: SettingsRepositoryDefault(defaults: UserDefaults()) // TODO add label
            )
        )
    )
    return contactsViewController
}

