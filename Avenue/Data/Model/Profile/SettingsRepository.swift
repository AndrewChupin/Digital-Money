//
//  SettingsRepository.swift
//  Avenue
//
//  Created by Andrew Chupin on 24.05.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

protocol SettingsRepository: Repository {
    var constactsStateToken: String { get set }
}

