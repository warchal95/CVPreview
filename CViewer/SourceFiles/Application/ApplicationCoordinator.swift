//
//  ApplicationCoordinator.swift
//  CViewer
//

import UIKit

final class ApplicationCoordinator: Coordinator {

    private unowned let window: UIWindow

    private let dependencies: ApplicationDependencies

    /// Initializes application coordinator with given properties.
    ///
    /// - Parameters:
    ///   - window: Window that the flow is started inside.
    ///   - dependencies: Dependencies of the application.
    init(window: UIWindow, dependencies: ApplicationDependencies) {
        self.window = window
        self.dependencies = dependencies
    }

    func start() {
        window.rootViewController = CVRootViewController(
            view: CVRootView(),
            viewModel: DefaultCVRootViewModel(requestPerformer: dependencies.httpRequestPerformer)
        )
    }
}
