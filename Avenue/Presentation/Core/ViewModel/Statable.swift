//
//  Statable.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import RxCocoa

protocol Statable {
    associatedtype ViewState: BaseViewState
    var viewState: BehaviorRelay<ViewState> { get }
}
