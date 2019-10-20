//
//  ViewController.swift
//  CViewer
//

import UIKit

class ViewController<CustomView: View>: UIViewController {

    /// Custom View of the ViewController.
    let customView: CustomView

    /// Initializes view controller with given view.
    ///
    /// - Parameter view: View of the view controller.
    init(view: CustomView) {
        self.customView = view
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
        view.clipsToBounds = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperties()
        setupCallbacks()
        setupBehaviour()
    }

    /// Sets up the properties of `self`. Called automatically on `viewDidLoad()`.
    func setupProperties() { }

    /// Sets up callbacks in `self`. Called automatically on `viewDidLoad()`.
    func setupCallbacks() { }

    /// Sets up behaviour in `self`. Called automatically on `viewDidLoad()`.
    func setupBehaviour() { }
}
