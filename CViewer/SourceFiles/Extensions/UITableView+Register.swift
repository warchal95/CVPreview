//
//  UITableView+Register.swift
//  CViewer
//

import UIKit

extension UITableView {

    /// Registers a new cell type for a tableView with it's class name as reuse identifier.
    ///
    /// - Parameter dequeueableCell: Cell that should be registered.
    func register<Cell>(dequeueableCell: Cell.Type) where Cell: UITableViewCell {
        register(Cell.self, forCellReuseIdentifier: Cell.className)
    }

    /// Dequeue cell of given type
    ///
    /// - Parameters:
    ///   - dequeueableCell: Cell that should be dequeued
    ///   - indexPath: IndexPath of the cell.
    func dequeue<Cell>(dequeueableCell: Cell.Type, forIndexPath indexPath: IndexPath) -> Cell where Cell: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: dequeueableCell.className, for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell of type \(Cell.self) with reuseIdentifier \(Cell.className)")
        }
        return cell
    }
}
