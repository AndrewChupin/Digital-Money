//
//  AuthTarget.swift
//  Avenue
//
//  Created by Andrew Chupin on 13.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya

enum AuthTarget {
    case signIn(request: RequestData)
}

extension AuthTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: AppConfig.avenueBaseUrl)!
    }
    
    var path: String {
        switch self {
        case .signIn:
            return AvenueApi.signIn.rawValue
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signIn:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .signIn(let request):
            return .requestParameters(parameters: request.getArguments(), encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signIn(let request):
            return request.getHeaders()
        }
    }
}
