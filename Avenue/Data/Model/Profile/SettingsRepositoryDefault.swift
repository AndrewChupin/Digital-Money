//
//  File.swift
//  Avenue
//
//  Created by Andrew Chupin on 24.05.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

enum RequestKey: String {
    case contasts = "constacts_token_key"
}

class SettingsRepositoryDefault {
    fileprivate let defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
}

extension SettingsRepositoryDefault: SettingsRepository {

    var constactsStateToken: String {
        get {
            let token = defaults.string(forKey: RequestKey.contasts.rawValue) ?? String.empty
            return token
        }
        set {
            defaults.set(newValue, forKey: RequestKey.contasts.rawValue)
        }
    }
}

