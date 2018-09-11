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


final class HistoryViewController: BaseViewController<HistoryViewModel, HistoryViewState> {
    
    static let identification = "HistoryView"
    
    // View reference
    @IBOutlet weak var tableHistory: UITableView!
    
    // Bind reference
    fileprivate var contacts: [Contact] = []
    fileprivate let disposable = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
        
        self.reducer?.reduce(with: .loadHistory)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func prepareTable() {
        self.tableHistory.register(ContactTableViewCell.nib, forCellReuseIdentifier: ContactTableViewCell.identification)
    }
    
    override func render(viewState: HistoryViewState) {
        /*viewState.contacts.drive(self.tableHistory.rx.items(cellIdentifier:ContactTableViewCell.identification, cellType: ContactTableViewCell.self)) { _, contact, cell in
            cell.setup(with: contact)
            }
            .disposed(by: self.disposable)*/
    }
}

