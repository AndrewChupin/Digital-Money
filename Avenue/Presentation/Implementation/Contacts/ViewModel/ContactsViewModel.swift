//
//  WelcomeViewModel.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

class ContactsViewModel: ContactsReference {
    
    private let dispose = DisposeBag()
    
    private var contactsList = Variable<[Contact]>([])
    private var isLoadingData = Variable(false)
    
    private var contactsInteractor: ContactsInteractor
    
    init(contactsInteractor: ContactsInteractor) {
        self.contactsInteractor = contactsInteractor
    }
    
    var contacts: Observable<[Contact]> {
        return self.contactsList.asObservable()
    }

    var isLoading: Observable<Bool> {
        return self.isLoadingData.asObservable()
    }
    
    func loadUsers() {
        contactsInteractor.findContacts()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] contacts in
                self?.contactsList.value.append(contentsOf: contacts)
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: dispose)
    }
}

