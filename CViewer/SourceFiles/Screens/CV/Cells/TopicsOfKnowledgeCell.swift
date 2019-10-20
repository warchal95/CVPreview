//
//  TopicsOfKnowledgeCell.swift
//  CViewer
//

import UIKit

final class TopicsOfKnowledgeCell: TableViewCell {

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = .init(top: 12, leading: 12, bottom: 12, trailing: 12)
        return stackView.layoutable()
    }()

    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Topics of knowledge"
        return label
    }()

    private let topicsOfInterestsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label.layoutable()
    }()

    override func setupViewHierarchy() {
        [sectionLabel, topicsOfInterestsLabel].forEach(stackView.addArrangedSubview)
        addSubview(stackView)
    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    /// Feeds cell with given topics.
    ///
    /// - Parameter topics: Topics of person.
    func feed(with topics: String) {
        topicsOfInterestsLabel.text = topics
    }
}
