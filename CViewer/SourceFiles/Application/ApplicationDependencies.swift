//
//  ApplicationDependencies.swift
//  CViewer
//

import Foundation

final class ApplicationDependencies {

    /// HTTP Request Performer.
    let httpRequestPerformer: HTTPRequestPerformer = DefaultHTTPRequestPerformer(session: URLSession.shared)
}
