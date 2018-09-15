//
// Created by Andrew Chupin on 31.03.2018.
// Copyright (c) 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class HistoryWebService {
    let networkProvider: MoyaProvider<HistoryTarget>

    init(networkProvider: MoyaProvider<HistoryTarget>) {
        self.networkProvider = networkProvider;
    }
}

extension HistoryWebService: HistoryService {
    func getHistory(request: ContactRequest) -> Single<[Contact]> {
        return networkProvider
            .rx
            .request(.loadHistory(request: request), callbackQueue: DispatchQueue.global(qos: .background))
            .map([Contact].self)
    }
}
