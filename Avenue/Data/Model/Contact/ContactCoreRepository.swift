//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

class ContactCoreRepository {

}

extension ContactCoreRepository: ContactsRepository {

    var count: Int {
        return 12
    }

    func findAll() -> Single<[Contact]> {
        return Single.just(contacts())
    }

    func findPart(partNumber: Int) -> Single<[Contact]> {
        return Single.just(contacts())
    }

    private func contacts() -> [Contact] {
        return [
            Contact(name: "Andrew Chupin", phone: "79042797431", image: "http://www.xcom-hobby.ru/mod/site/img/default-userpic.png"),
            Contact(name: "Mike Chupin", phone: "79042797431", image: "http://www.xcom-hobby.ru/mod/site/img/default-userpic.png"),
            Contact(name: "John Chupin", phone: "79042797431", image: "http://www.xcom-hobby.ru/mod/site/img/default-userpic.png"),
            Contact(name: "Anthony Chupin", phone: "79042797431", image: "http://www.xcom-hobby.ru/mod/site/img/default-userpic.png"),
            Contact(name: "Matt Chupin", phone: "79042797431", image: "http://www.xcom-hobby.ru/mod/site/img/default-userpic.png"),
            Contact(name: "Jayson Chupin", phone: "79042797431", image: "http://www.xcom-hobby.ru/mod/site/img/default-userpic.png")
        ]
    }
}
