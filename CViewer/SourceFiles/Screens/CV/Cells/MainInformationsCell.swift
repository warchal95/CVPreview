//
//  MainInformationsCell.swift
//  CViewer
//

import UIKit

final class MainInformationsCell: TableViewCell {

    private let mainInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView.layoutable()
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
        return imageView.layoutable()
    }()

    private let personNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        return label.layoutable()
    }()

    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .justified
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label.layoutable()
    }()

    override func setupViewHierarchy() {
        [mainInfoStackView].forEach(addSubview)
        [avatarImageView, personNameLabel, summaryLabel].forEach(mainInfoStackView.addArrangedSubview)
    }

    override func setupConstraints() {
        mainInfoStackView.setCustomSpacing(3, after: avatarImageView)
        mainInfoStackView.setCustomSpacing(5, after: personNameLabel)

        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            summaryLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8),
            mainInfoStackView.leftAnchor.constraint(equalTo: leftAnchor),
            mainInfoStackView.rightAnchor.constraint(equalTo: rightAnchor),
            mainInfoStackView.topAnchor.constraint(equalTo: topAnchor),
            mainInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    /// Feeds cell with given parameters.
    ///
    /// - Parameters:
    ///   - curriculumVitae: Curriculum Vitae of the person.
    ///   - avatarImage: Avatar image of the person.
    func feed(with curriculumVitae: CurriculumVitae, avatarImage: UIImage) {
        personNameLabel.text = curriculumVitae.personName
        summaryLabel.text = curriculumVitae.summary
        avatarImageView.image = avatarImage
    }
}
