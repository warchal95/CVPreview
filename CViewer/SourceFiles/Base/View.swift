//
//  View.swift
//  CViewer
//

import UIKit

class View: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Sets up view hierarchy. Called automatically on `init(frame:)`.
    func setupViewHierarchy() { }

    /// Sets up the constraints. Called automatically on `init(frame:)`.
    func setupConstraints() { }

    private func setupView() {
        setupViewHierarchy()
        setupConstraints()
    }
}
