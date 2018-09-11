//
//  WelcomeViewController.swift
//  Avenue
//
//  Created by Andrew Chupin on 31.03.2018.
//  Copyright © 2018 Andrew Chupin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


final class ContactsViewController: BaseViewController<ContactsViewModel, ContactsViewState> {
    
    static let identification = "ContactsView"
    
    // View reference
    @IBOutlet weak var tableContacts: UITableView!
    
    // Bind reference
    fileprivate var contacts: [Contact] = []
    fileprivate let disposable = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
        
        self.tableContacts.rowHeight = 80.0
        
        self.reducer?.reduce(with: .loadContacts)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func prepareTable() {
        self.tableContacts.register(ContactTableViewCell.nib, forCellReuseIdentifier: ContactTableViewCell.identification)
    }
    
    override func render(viewState: ContactsViewState) {
        /*viewState.contacts.drive(self.tableContacts.rx.items(cellIdentifier:ContactTableViewCell.identification, cellType: ContactTableViewCell.self)) { _, contact, cell in
            cell.setup(with: contact)
            }
            .disposed(by: self.disposable)*/
    }
}

