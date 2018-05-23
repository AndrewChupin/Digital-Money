//
//  ContactRequest.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

enum ContactsParameters: String {
    case token = "token"
}

struct ContactRequest {
    let token: String
}

extension ContactRequest: RequestData {
    func getArguments() -> Parameters {
        var result: Parameters = [:]
        result[ContactsParameters.token.rawValue] = token
        return result
    }
    
    func getHeaders() -> Headers {
        return [:]
    }
    
    func getBody() -> Parameters {
        return [:]
    }
}
