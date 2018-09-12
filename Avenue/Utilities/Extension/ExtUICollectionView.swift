//
//  ExtCollectionView.swift
//  Avenue
//
//  Created by Andrew Chupin on 12.09.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell(withModel model: CellAnyViewModel, for indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: type(of: model).cellAnyType)
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        model.setupAnyCell(cell: cell)
        return cell
    }
    
    func reigister(nibModels: [CellAnyViewModel.Type]) {
        for model in nibModels {
            let identifier = String(describing: model.cellAnyType)
            let nib = UINib(nibName: identifier, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: identifier)
        }
    }
}
