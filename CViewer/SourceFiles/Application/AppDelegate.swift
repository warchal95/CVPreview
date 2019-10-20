//
//  AppDelegate.swift
//  CViewer
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        return window
    }()

    private lazy var applicationCoordinator: Coordinator = ApplicationCoordinator(window: window!, dependencies: dependencies)

    private let dependencies = ApplicationDependencies()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        applicationCoordinator.start()
        return true
    }
}

