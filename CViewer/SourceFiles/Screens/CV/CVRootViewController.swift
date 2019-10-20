//
//  CVRootViewController.swift
//  CViewer
//

import UIKit

final class CVRootViewController: ViewController<CVRootView> {

    private let viewModel: CVRootViewModel

    /// Initializes ViewController with given View and ViewModel.
    ///
    /// - Parameters:
    ///   - view: Custom view of the screen.
    ///   - viewModel: ViewModel of the screen.
    init(view: CVRootView, viewModel: CVRootViewModel) {
        self.viewModel = viewModel
        super.init(view: view)
    }

    override func setupProperties() {
        customView.tableView.register(dequeueableCell: PastExperienceCell.self)
        customView.tableView.register(dequeueableCell: MainInformationsCell.self)
        customView.tableView.register(dequeueableCell: TopicsOfKnowledgeCell.self)
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
    }

    override func setupCallbacks() {
        customView.refreshControl.addTarget(self, action: #selector(refreshDataSource), for: .valueChanged)
    }

    override func setupBehaviour() {
        fetchDataSource(isRefreshing: false)
    }

    private func fetchDataSource(isRefreshing: Bool) {
        viewModel.fetchDataSource { [weak self] didSucceed in
            DispatchQueue.main.async {
                if didSucceed {
                    self?.customView.tableView.reloadData()
                } else {
                    self?.alert(with: "Oops", message: "Something went wrong. Please try again.")
                }
                guard isRefreshing else { return }
                self?.customView.refreshControl.endRefreshing()
            }
        }
    }

    @objc private func refreshDataSource() {
        fetchDataSource(isRefreshing: true)
    }
}

extension CVRootViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType: UITableViewCell.Type
        if indexPath.row == 0 {
            cellType = MainInformationsCell.self
        } else if indexPath.row == viewModel.elementsCount - 1 {
            cellType = TopicsOfKnowledgeCell.self
        } else {
            cellType = PastExperienceCell.self
        }
        let cell = tableView.dequeue(dequeueableCell: cellType, forIndexPath: indexPath)
        viewModel.configureCell(cell, with: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.elementsCount
    }
}
