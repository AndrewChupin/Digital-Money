//
//  ViewState.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation

enum PrimaryState {
    case loading
    case common
    case succeess
}

protocol BaseViewState: NSCopying {
    var primaryState: PrimaryState { get }
}
