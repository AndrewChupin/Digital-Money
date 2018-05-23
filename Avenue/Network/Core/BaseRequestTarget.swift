//
//  BaseRequestTarget.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya

enum BaseRequestTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: AppConfig.avenueBaseUrl)!
    }
    
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method = {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
