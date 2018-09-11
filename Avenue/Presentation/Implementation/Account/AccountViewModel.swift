//
// Created by Andrew Chupin on 10.09.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK - Actions
enum AccountActions: Actionable {
    case signIn(SignInData)
}

// MARK - SignIn Action Presentation Data
struct SignInData {
    let login: String
    let code: String
}

// MARK - State
class AccountViewState: BaseViewState {
    var primaryState: PrimaryState = .common
    
    func copy(with zone: NSZone? = nil) -> Any {
        return AccountViewState()
    }
}

// MARK - Reducer
protocol AccountStatementReducer: StatmentReducer where Action == AccountActions, ViewState == AccountViewState {}

// MARK - ViewModel
class AccountViewModel: BaseViewModel, AccountStatementReducer {
    var viewState: BehaviorRelay<AccountViewState> = BehaviorRelay(value: AccountViewState())
    
    func reduce(with action: AccountActions) {
        switch action {
        case .signIn(let name):
            print(name)
        }
    }
}
