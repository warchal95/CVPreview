//
//  UIViewController+Alert.swift
//  CViewer
//

import UIKit

extension UIViewController {

    /// Presents alert controller that can be dismissed with the `OK` button.
    ///
    /// - Parameters:
    ///   - title: Title of the alert.
    ///   - message: Message of the alert.
    func alert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: title, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}
