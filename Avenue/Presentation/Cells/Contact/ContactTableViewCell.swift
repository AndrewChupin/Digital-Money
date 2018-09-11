//
//  ContactTableViewCell.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit
import Kingfisher

final class ContactTableViewCell: UITableViewCell {
    
    static let identification = "ContactCellView"
    static let nib = UINib(nibName: ContactTableViewCell.identification, bundle: nil)

    @IBOutlet weak var imageContact: UIImageView!
    @IBOutlet weak var labelContactName: UILabel!
    @IBOutlet weak var labelContactPhone: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageContact.clipsToBounds = true
        self.imageContact.layer.cornerRadius = imageContact.frame.width / 2
    }

    func setup(with contact: Contact) {
        self.labelContactName.text = contact.name
        self.labelContactPhone.text = contact.phone
        let url = URL(string: contact.image)
        self.imageContact.kf.setImage(with: url)
    }

}
