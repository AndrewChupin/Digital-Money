//
//  CellView.swift
//  Avenue
//
//  Created by Andrew Chupin on 12.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit

protocol CellAnyViewModel {
    static var cellAnyType: UIView.Type { get }
    func setupAnyCell(cell: UIView)
}

protocol CellViewModel: CellAnyViewModel {
    associatedtype CellType: UIView
    func setup(cell: CellType)
}

extension CellViewModel {
    static var cellAnyType: UIView.Type {
        return CellType.self
    }
    func setupAnyCell(cell: UIView) {
        setup(cell: cell as! CellType)
    }
}
