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

enum BaseError: Error {
    case base
}

class ContactsViewModel: ContactsReference {
    
    // Data
    private var contactsList = BehaviorRelay<[Contact]>(value: [])
    private var isLoadingData = BehaviorRelay(value: false)
    private var errorData = BehaviorRelay<Error>(value: BaseError.base)
    
    // Bindable Data
    var contacts: Driver<[Contact]> {
        return self.contactsList.asDriver()
    }
    
    var error: Driver<Error> {
        return self.errorData.asDriver()
    }
    
    var isLoading: Driver<Bool> {
        return self.isLoadingData.asDriver()
    }
    
    // Dispose
    private let dispose = DisposeBag()
    
    // Use Cases
    private var contactsInteractor: ContactsInteractor
    
    // Constructor
    init(contactsInteractor: ContactsInteractor) {
        self.contactsInteractor = contactsInteractor
    }
    
    // Actions
    func loadUsers() {
        contactsInteractor.findContacts()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] (contactsData) in
                self?.contactsList.accept(contactsData)
            }, onError: { [weak self] (e) in
                self?.errorData.accept(e)
            })
            .disposed(by: dispose)
    }
}

