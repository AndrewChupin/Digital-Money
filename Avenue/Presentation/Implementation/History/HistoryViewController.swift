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
import Kingfisher

final class HistoryViewController: BaseViewController<HistoryViewModel, HistoryViewState>, UITableViewDataSource, UITableViewDelegate {
    
    // View reference
    @IBOutlet weak var tableHistory: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
        
        self.reducer?.reduce(with: .loadHistory)
    }

    private func prepareTable() {
        self.tableHistory.register(HistoryTableViewCell.nib, forCellReuseIdentifier: HistoryTableViewCell.identification)
    }
    
    override func render(viewState: HistoryViewState) {
        tableHistory.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reducer?.viewState.value.history.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identification) as! HistoryTableViewCell
        
        if let history = self.reducer?.viewState.value.history[indexPath.row] {
            cell.setup(with: history)
        }
        return cell
    }
}
