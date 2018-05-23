//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class ContactsWebService {
    let networkProvider: MoyaProvider<ContactsTarget>

    init(networkProvider: MoyaProvider<ContactsTarget>) {
        self.networkProvider = networkProvider;
    }
}


extension ContactsWebService: ContactsService {
    func getContacts(request: ContactRequest) -> Single<[Contact]> {
        return networkProvider
            .rx
            .request(.loadContacts(request: request), callbackQueue: DispatchQueue.global(qos: .background))
            .map([Contact].self)
            .flatMap({ contacts in
                return Single.just(contacts)
            })
    }
}
