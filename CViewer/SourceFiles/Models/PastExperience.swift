//
//  PastExperience.swift
//  CViewer
//

import Foundation

struct PastExperience: Codable {

    private enum CodingKeys: String, CodingKey {
        case companyName = "company_name"
        case roleName = "role_name"
        case startDate = "start_date"
        case endDate = "end_date"
        case achievementsDescription = "achievements_description"
    }

    /// Name of the company.
    let companyName: String

    /// Role name.
    let roleName: String

    /// Start date of the job.
    let startDate: Date

    /// End date of the job.
    let endDate: Date

    /// Description of the achievements in the job.
    let achievementsDescription: String
}
