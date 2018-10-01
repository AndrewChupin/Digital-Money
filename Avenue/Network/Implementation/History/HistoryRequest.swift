//
//  HistoryRequest.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

enum HistoryParameters: String {
    case token = "token"
}

struct HistoryRequest {
    let token: String
}

extension HistoryRequest: RequestData {
    func getArguments() -> Parameters {
        var result: Parameters = [:]
        result[HistoryParameters.token.rawValue] = token
        return result
    }
    
    func getHeaders() -> Headers {
        return [:]
    }
    
    func getBody() -> Parameters {
        return [:]
    }
}
