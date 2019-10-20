//
//  UIView+Layout.swift
//  CViewer
//

import UIKit

extension UIView {

    /// Returns view with the same type that can be used with AutoLayout.
    ///
    /// - Returns: Adjusted view with `translatesAutoresizingMaskIntoConstraints` set to `false`.
    func layoutable() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
