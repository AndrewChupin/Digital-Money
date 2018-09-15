//
//  Account.swift
//  Avenue
//
//  Created by Andrew Chupin on 13.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

final class Account {
    let firstName: String
    let secondName: String
    let offerNumber: String
    let balance: String
    
    init(firstName: String, secondName: String, offerNumber: String, balance: String) {
        self.firstName = firstName
        self.secondName = secondName
        self.offerNumber = offerNumber
        self.balance = balance
    }
}

extension Account: Decodable {
    private enum AccountFields: String, CodingKey {
        case firstName = "firstName"
        case secondName = "secondName"
        case offerNumber = "offerNumber"
        case balance = "balance"
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AccountFields.self)
        let firstName: String = try container.decode(String.self, forKey: .firstName)
        let secondName: String = try container.decode(String.self, forKey: .secondName)
        let offerNumber: String = try container.decode(String.self, forKey: .offerNumber)
        let balance: String = try container.decode(String.self, forKey: .balance)
        
        self.init(firstName: firstName, secondName: secondName, offerNumber: offerNumber, balance: balance)
    }
}
