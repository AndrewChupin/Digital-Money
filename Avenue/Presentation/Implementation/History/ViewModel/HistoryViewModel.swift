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
    var history: [History] = []
    
    init(state: PrimaryState = .common, history: [History] = []) {
        self.primaryState = state
        self.history = history
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
    private var historyInteractor: HistoryInteractor
    // Data
    var viewState: BehaviorRelay<HistoryViewState> = BehaviorRelay(value: HistoryViewState())
    
    // Constructor
    init(historyInteractor: HistoryInteractor) {
        self.historyInteractor = historyInteractor
    }
    
    func reduce(with action: HistoryActions) {
        switch action {
        case .loadHistory:
            loadUsers()
        }
    }
    
    // Actions
    private func loadUsers() {
        historyInteractor.findHistory()
            .bindSubscribe(success: { [weak self] (historyData) in
                print(historyData)
                self?.viewState.accept(HistoryViewState(history: historyData))
            }).disposed(by: bag)
    }
}

