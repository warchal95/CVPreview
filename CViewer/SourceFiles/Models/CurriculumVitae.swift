//
//  CurriculumVitae.swift
//  CViewer
//

struct CurriculumVitae: Codable {

    private enum CodingKeys: String, CodingKey {
        case experiences = "past_experience"
        case personName = "name"
        case avatarPath = "avatar_path"
        case topicsOfKnowledge = "knowledge_topics"
        case summary
    }

    /// Path of the avatar.
    let avatarPath: String

    /// Full name of the person.
    let personName: String

    /// Summary of the person's experiences.
    let summary: String

    /// Topics of knowledge for which the person has strong experiences.
    let topicsOfKnowledge: String

    /// Experiences of the person.
    let experiences: [PastExperience]
}
