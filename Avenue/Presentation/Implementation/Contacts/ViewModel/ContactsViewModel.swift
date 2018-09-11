//
//  WelcomeViewModel.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK - Actions
enum ContactsActions: Actionable {
    case loadContacts
}

// MARK - ViewState
class ContactsViewState: BaseViewState {
    var primaryState: PrimaryState = .common
    var contacts: [Contact] = []
    
    init(state: PrimaryState = .common, contacts: [Contact] = []) {
        self.primaryState = state
        self.contacts = contacts
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return ContactsViewState()
    }
}

// MARK - Reducer
protocol ContactsStatementReducer: StatmentReducer where Action == ContactsActions, ViewState == ContactsViewState {}

// MARK - ViewModel
class ContactsViewModel: BaseViewModel, ContactsStatementReducer {
    
    // Use Cases
    private var contactsInteractor: ContactsInteractor
    // Data
    var viewState: BehaviorRelay<ContactsViewState> = BehaviorRelay(value: ContactsViewState())
    
    // Constructor
    init(contactsInteractor: ContactsInteractor) {
        self.contactsInteractor = contactsInteractor
    }
    
    func reduce(with action: ContactsActions) {
        switch action {
        case .loadContacts:
            loadUsers()
        }
    }
    
    // Actions
    private func loadUsers() {
        contactsInteractor.findContacts()
            .bindSubscribe(success: { [weak self] (contactsData) in
                self?.viewState.accept(ContactsViewState(contacts: contactsData))
            })
    }
}

