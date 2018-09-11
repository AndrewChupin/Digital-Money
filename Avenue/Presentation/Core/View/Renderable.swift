//
//  Renderable.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

protocol Renderable {
    associatedtype ViewState: BaseViewState
    func render(viewState: ViewState)
}
