//
//  HistoryTableViewCell.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit
import Kingfisher

final class HistoryTableViewCell: UITableViewCell {
    
    static let identification = "HistoryCellView"
    static let nib = UINib(nibName: HistoryTableViewCell.identification, bundle: nil)

    @IBOutlet weak var imageHistory: UIImageView!
    @IBOutlet weak var labelHistoryName: UILabel!
    @IBOutlet weak var labelHistoryPhone: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageHistory.clipsToBounds = true
        self.imageHistory.layer.cornerRadius = imageHistory.frame.width / 2
    }

    func setup(with contact: History) {
        self.labelHistoryName.text = contact.name
        self.labelHistoryPhone.text = contact.phone
        let url = URL(string: contact.image)
        self.imageHistory.kf.setImage(with: url)
    }

}
