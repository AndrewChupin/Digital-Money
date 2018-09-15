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
    case auth = "auth_token_key"
}

class SettingsRepositoryDefault {
    fileprivate let defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
}

extension SettingsRepositoryDefault: SettingsRepository {
    var authToken: String {
        get { return defaults.string(forKey: RequestKey.auth.rawValue) ?? String.empty }
        set { defaults.set(newValue, forKey: RequestKey.auth.rawValue) }
    }
    
    var constactsStateToken: String {
        get { return defaults.string(forKey: RequestKey.contasts.rawValue) ?? String.empty }
        set { defaults.set(newValue, forKey: RequestKey.contasts.rawValue) }
    }
}

