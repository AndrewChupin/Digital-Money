//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya

protocol NetworkProvider {

    associatedtype Target: TargetType
    
    func send(target: Target)
    
}


class NetworkProviderMoya<TargetRequest: TargetType>: NetworkProvider {
    
    typealias Target = TargetRequest
    
    func send<Target: TargetType>(target: Target) {
        
    }
    
}

