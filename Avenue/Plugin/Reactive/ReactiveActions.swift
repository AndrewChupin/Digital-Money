//
//  ReactiveActions.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ReactiveActions {
    var bag: DisposeBag { get }
}

extension ReactiveActions {
    var bag: DisposeBag {
        return DisposeBag()
    }
}

extension PrimitiveSequence: ReactiveActions where TraitType == RxSwift.SingleTrait {
    func bindSubscribe(
            scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background),
            success: ((PrimitiveSequence.ElementType) -> Void)? = { _ in },
            error: ((Error) -> Swift.Void)? = { _ in }
    ) {
        self.subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: success, onError: error)
            .disposed(by: bag)
    }
}


class Reactive: ReactiveActions {
    
    func dsads() {
        Single.just(12)
            .bindSubscribe(success: { value in
                
            })
    }
    
}
