//
//  AvenueViewController.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewController<ReducerType: StatmentReducer, ViewStateType: BaseViewState>: UIViewController, Renderable {
    
    typealias ViewState = ViewStateType
    
    private let bag = DisposeBag()
    
    var reducer: ReducerType? = nil
    
    init(name: String, reducer: ReducerType) {
        super.init(nibName: name, bundle: nil)
        self.reducer = reducer
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reducer?.viewState.asDriver().drive(onNext: { state in
            guard state is ViewStateType else {
                return
            }
            self.render(viewState: state as! ViewStateType)
        }).disposed(by: bag)
    }
    
    func render(viewState: ViewStateType) {
        // Do nothing
    }
}
