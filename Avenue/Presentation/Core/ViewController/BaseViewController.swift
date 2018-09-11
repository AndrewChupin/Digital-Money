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
    var reducer: ReducerType? = nil
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
