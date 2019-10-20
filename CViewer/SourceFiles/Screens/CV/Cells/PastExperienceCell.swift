//
//  PastExperienceCell.swift
//  CViewer
//

import UIKit

final class PastExperienceCell: TableViewCell {

    private let horizontalTopStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        return stackView.layoutable()
    }()

    private let datesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        return stackView.layoutable()
    }()

    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = .init(top: 12, leading: 12, bottom: 12, trailing: 12)
        stackView.axis = .vertical
        return stackView.layoutable()
    }()
 
    private let companyNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    private let startDateLabel = UILabel().layoutable()

    private let endDateLabel = UILabel().layoutable()

    private let roleNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()

    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()

    private let achievementsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Achievements"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()

    private let achievementsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()

    override func setupViewHierarchy() {
        addSubview(containerStackView)
        [companyNameLabel, roleNameLabel].forEach(horizontalTopStackView.addArrangedSubview)
        [startDateLabel, endDateLabel].forEach(datesStackView.addArrangedSubview)
        [horizontalTopStackView, datesStackView, achievementsTitleLabel, achievementsLabel, separatorView].forEach(containerStackView.addArrangedSubview)
    }

    override func setupConstraints() {
        horizontalTopStackView.setCustomSpacing(6, after: companyNameLabel)
        containerStackView.setCustomSpacing(8, after: horizontalTopStackView)
        containerStackView.setCustomSpacing(12, after: datesStackView)
        containerStackView.setCustomSpacing(8, after: achievementsLabel)
        NSLayoutConstraint.activate([
            containerStackView.leftAnchor.constraint(equalTo: leftAnchor),
            containerStackView.rightAnchor.constraint(equalTo: rightAnchor),
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    override func setupProperties() {
        [startDateLabel, endDateLabel].forEach {
            $0.font = .systemFont(ofSize: 15)
        }
    }

    /// Feeds cell with given experience.
    ///
    /// - Parameter pastExperience: Past experience of the person.
    func feed(with pastExperience: PastExperience) {
        companyNameLabel.text = pastExperience.companyName
        roleNameLabel.text = pastExperience.roleName
        achievementsLabel.text = pastExperience.achievementsDescription

        let dateFormatter = DateFormatterPool.monthYearDateFormatter
        startDateLabel.text = "From: \(dateFormatter.string(from: pastExperience.startDate))"
        endDateLabel.text = "To: \(dateFormatter.string(from: pastExperience.endDate))"
    }
}
