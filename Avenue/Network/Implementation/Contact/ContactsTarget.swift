
//
//  ContactsTarget.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya

enum ContactsTarget {
    case loadContacts(request: RequestData)
}

extension ContactsTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: AppConfig.avenueBaseUrl)!
    }
    
    var path: String {
        switch self {
        case .loadContacts:
            return AvenueApi.getContacts.rawValue
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .loadContacts:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .loadContacts(let request):
            return .requestParameters(parameters: request.getArguments(), encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .loadContacts(let request):
            return request.getHeaders()
        }
    }
}

