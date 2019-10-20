//
//  TableViewCell.swift
//  CViewer
//

import UIKit

class TableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        setupViewHierarchy()
        setupConstraints()
        setupProperties()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Sets up view hierarchy. Called automatically on `init(style:reuseIdentifier:)`.
    func setupViewHierarchy() { }

    /// Sets up the constraints. Called automatically on `init(style:reuseIdentifier:)`.
    func setupConstraints() { }

    /// Sets up the properties of `self`. Called automatically on `init(style:reuseIdentifier:)`.
    func setupProperties() { }
}
