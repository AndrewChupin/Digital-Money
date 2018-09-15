//
//  AuthRequest.swift
//  Avenue
//
//  Created by Andrew Chupin on 13.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

enum AuthParameters: String {
    case authToken = "auth_token"
}

struct AuthRequest {
    let authToken: String
}

extension AuthRequest: RequestData {
    func getArguments() -> Parameters {
        return [:]
    }
    
    func getHeaders() -> Headers {
        return [:]
    }
    
    func getBody() -> Parameters {
        var result: Parameters = [:]
        result[AuthParameters.authToken.rawValue] = authToken
        return result
    }
}
