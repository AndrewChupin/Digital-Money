//
//  AuthViewModel.swift
//  Avenue
//
//  Created by Andrew Chupin on 12.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK - Actions
enum AuthActions: Actionable {
    case signIn(SignInData)
}

// MARK - SignIn Action Presentation Data
struct SignInData {
    let login: String
    let code: String
}

// MARK - State
class AuthViewState: BaseViewState {
    let primaryState: PrimaryState
    
    init(state: PrimaryState = .common) {
        self.primaryState = state
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return AuthViewState()
    }
}

// MARK - Reducer
protocol AuthStatementReducer: StatmentReducer where Action == AuthActions, ViewState == AuthViewState {}

// MARK - ViewModel
class AuthViewModel: BaseViewModel, AuthStatementReducer {
    var viewState: BehaviorRelay<AuthViewState> = BehaviorRelay(value: AuthViewState())
    private var interactor: AuthInteractor
    
    init(interactor: AuthInteractor) {
        self.interactor = interactor
    }
    
    func reduce(with action: AuthActions) {
        switch action {
        case .signIn(let data):
            interactor.signIn(data: data)
                .bindSubscribe(success: { account in
                    print(account)
                    self.viewState.accept(AuthViewState(state: .succeess))
            }).disposed(by: bag)
        }
    }
}
