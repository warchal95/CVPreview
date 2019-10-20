//
//  HTTPRequestPerformer.swift
//  CViewer
//

import UIKit

protocol HTTPRequestPerformer {

    /// Performs data task with given parameters.
    ///
    /// - Parameters:
    ///   - request: URLRequest that should be performed.
    ///   - responseType: Type of the response.
    ///   - completion: Completion block with optional decoded object and optional error.
    func performDataTask<T: Decodable>(with request: URLRequest, responseType: T.Type, completion: @escaping ((T?, Error?) -> Void))

    /// Fetched image for given url.
    ///
    /// - Parameters:
    ///   - url: URL of the image.
    ///   - completion: Completion block with optional UIImage object.
    func fetchImage(with url: URL, completion: @escaping ((UIImage?) -> Void))
}

final class DefaultHTTPRequestPerformer: HTTPRequestPerformer {

    private let session: URLSession

    /// Initializes HTTPRequestPerformer with given session.
    ///
    /// Parameter session: URLSession fot requests.
    init(session: URLSession) {
        self.session = session
    }

    func performDataTask<T>(with request: URLRequest, responseType: T.Type, completion: @escaping ((T?, Error?) -> Void)) where T : Decodable {
        let task = session.dataTask(with: request) { data, response, error in
            guard
                error == nil,
                let response = response as? HTTPURLResponse,
                (200 ..< 300).contains(response.statusCode),
                let data = data
            else {
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatterPool.defaultDateFormatter)
            do {
                let parsedResponse = try decoder.decode(responseType, from: data)
                completion(parsedResponse, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }

    func fetchImage(with url: URL, completion: @escaping ((UIImage?) -> Void)) {
        let task = session.dataTask(with: url) { data, response, error in
            guard
                error == nil,
                let httpURLResponse = response as? HTTPURLResponse,
                httpURLResponse.statusCode == 200,
                let data = data
            else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }
        task.resume()
    }
}
