//
//  CVRootViewModel.swift
//  CViewer
//

import Foundation
import UIKit

protocol CVRootViewModel {

    /// Number of cells that should be visible in view controller.
    var elementsCount: Int { get }

    /// Fetches data source.
    ///
    /// - Parameter completion: Completion block of the fetch operations.
    func fetchDataSource(completion: @escaping (Bool) -> Void)

    /// Configures given cell.
    ///
    /// - Parameters:
    ///   - cell: Cell that should be configured.
    ///   - index: Index of the cell.
    func configureCell<T: UITableViewCell>(_ cell: T,  with index: Int)
}

final class DefaultCVRootViewModel: CVRootViewModel {

    var elementsCount: Int {
        guard let curriculumVitae = curriculumVitae else { return 0 }
        return curriculumVitae.experiences.count + numberOfConstantSections
    }

    private var curriculumVitae: CurriculumVitae?

    private var avatarImage: UIImage?

    private let numberOfConstantSections = 2

    private let requestPerformer: HTTPRequestPerformer

    private let apiUrl = URL(string: "https://gist.githubusercontent.com/warchal95/964eb67fdd3e3d5dabad66be1ac1b7fa/raw/9b8aa351003f788ab17233e8ec431d463376a394/gistfile1.txt")

    /// Initializes ViewModel with given request performer.
    ///
    /// - Parameter requestPerformer: HTTP request performer.
    init(requestPerformer: HTTPRequestPerformer) {
        self.requestPerformer = requestPerformer
    }

    func fetchDataSource(completion: @escaping (Bool) -> Void) {
        fetchCurriculumVitae { [weak self] curriculumVitae in
            guard let curriculumVitae = curriculumVitae else {
                completion(false)
                return
            }
            self?.fetchImage(with: curriculumVitae.avatarPath, completion: completion)
        }
    }

    func configureCell<T>(_ cell: T, with index: Int) where T : UITableViewCell {
        guard let curriculumVitae = curriculumVitae else { return }

        if cell is TopicsOfKnowledgeCell {
            (cell as? TopicsOfKnowledgeCell)?.feed(with: curriculumVitae.topicsOfKnowledge)
        } else if cell is MainInformationsCell {
            guard let avatarImage = avatarImage else { return }
            (cell as? MainInformationsCell)?.feed(with: curriculumVitae, avatarImage: avatarImage)
        } else {
            (cell as? PastExperienceCell)?.feed(with: curriculumVitae.experiences[index - 1])
        }
    }

    private func fetchCurriculumVitae(completion: @escaping (CurriculumVitae?) -> Void) {
        guard let url = apiUrl else {
            completion(nil)
            return
        }
        requestPerformer.performDataTask(with: URLRequest(url: url), responseType: CurriculumVitae.self) { [weak self] curriculumVitae, error in
            guard error == nil else {
                completion(nil)
                return
            }
            self?.curriculumVitae = curriculumVitae
            completion(curriculumVitae)
        }
    }

    private func fetchImage(with path: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: path) else {
            completion(false)
            return
        }
        requestPerformer.fetchImage(with: url) { [weak self] image in
            self?.avatarImage = image
            completion(true)
        }
    }
}
