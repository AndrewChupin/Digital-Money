//
//  BaseReference.swift
//  Avenue
//
//  Created by Andrew Chupin on 28.05.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import Foundation
import RxCocoa

protocol BaseReference: LoadingReference, ErrorReference {}

protocol LoadingReference {
    var isLoading: Driver<Bool> { get }
}

protocol ErrorReference {
    var error: Driver<Error> { get }
}
