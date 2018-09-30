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
        reducer?.viewState.asDriver().drive(onNext: { vs in
            
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: bag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func render(viewState: ViewStateType) {
        // Do nothing
    }
}
