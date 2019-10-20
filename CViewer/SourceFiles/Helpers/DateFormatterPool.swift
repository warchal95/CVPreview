//
//  DateFormatterPool.swift
//  CViewer
//

import Foundation

enum DateFormatterPool {

    /// Default date formatter. Should be used to map dates from requests.
    static let defaultDateFormatter = DateFormatterPool.get(format: "dd/MM/yyyy")

    /// Date formatter wich Month Year format.
    static let monthYearDateFormatter = DateFormatterPool.get(format: "MMMM yyyy")

    private static var formatters: [String: DateFormatter] = [:]

    /// Returns date formatter for given format.
    ///
    /// - Parameters:
    ///   - format: Format of the date.
    ///   - timezone: Timezone.
    static func get(format: String, timezone: TimeZone = TimeZone.current) -> DateFormatter {
        let code = timezone.identifier
        let identifier = format + code

        if let formatter = formatters[identifier] {
            return formatter
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            dateFormatter.timeZone = timezone
            formatters[identifier] = dateFormatter
            return dateFormatter
        }
    }
}
