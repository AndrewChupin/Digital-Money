//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxSwift

class HistoryCoreRepository {}

extension HistoryCoreRepository: HistoryRepository {

    var count: Int {
        return 12
    }

    func findAll() -> Single<[History]> {
        return Single.just(history())
    }

    func findPart(partNumber: Int) -> Single<[History]> {
        return Single.just(history())
    }

    private func history() -> [History] {
        return []
    }
}
