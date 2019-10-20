//
//  CVRootView.swift
//  CViewer
//

import UIKit

final class CVRootView: View {

    /// Table View with content of the main screen.
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 160
        tableView.refreshControl = refreshControl
        return tableView.layoutable()
    }()

    /// Refresh control of the table view.
    let refreshControl = UIRefreshControl()

    override func setupViewHierarchy() {
        addSubview(tableView)
    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
