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
enum HistoryActions: Actionable {
    case loadHistory
}

// MARK - ViewState
class HistoryViewState: BaseViewState {
    var primaryState: PrimaryState = .common
    var contacts: [Contact] = []
    
    init(state: PrimaryState = .common, contacts: [Contact] = []) {
        self.primaryState = state
        self.contacts = contacts
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return HistoryViewState()
    }
}

// MARK - Reducer
protocol HistoryStatementReducer: StatmentReducer where Action == HistoryActions, ViewState == HistoryViewState {}

// MARK - ViewModel
class HistoryViewModel: BaseViewModel, HistoryStatementReducer {
    
    // Use Cases
    private var contactsInteractor: HistoryInteractor
    // Data
    var viewState: BehaviorRelay<HistoryViewState> = BehaviorRelay(value: HistoryViewState())
    
    // Constructor
    init(contactsInteractor: HistoryInteractor) {
        self.contactsInteractor = contactsInteractor
    }
    
    func reduce(with action: HistoryActions) {
        switch action {
        case .loadHistory:
            loadUsers()
        }
    }
    
    // Actions
    private func loadUsers() {
        contactsInteractor.findHistory()
            .bindSubscribe(success: { [weak self] (contactsData) in
                self?.viewState.accept(HistoryViewState(contacts: contactsData))
            })
    }
}

