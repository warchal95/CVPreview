//
//  NSObject+Name.swift
//  CViewer
//

import Foundation

extension NSObject {

    /// Returns class name stripped from module name.
    class var className: String {
        let namespaceClassName = String(describing: self)
        return namespaceClassName.components(separatedBy: ".").last!
    }
}
