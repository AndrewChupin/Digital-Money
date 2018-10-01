//
//  ReactiveActions.swift
//  Avenue
//
//  Created by Andrew Chupin on 11.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ReactiveActions {}


extension PrimitiveSequence: ReactiveActions where TraitType == RxSwift.SingleTrait {
    func bindSubscribe(
            scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background),
            success: ((PrimitiveSequence.ElementType) -> Void)? = { _ in },
            error: ((Error) -> Swift.Void)? = { _ in }
    ) -> Disposable {
        return subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: success, onError: error)
    }
}
