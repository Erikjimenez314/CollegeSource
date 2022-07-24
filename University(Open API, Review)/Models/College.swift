//
//  College.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 4/24/22.
//

import Foundation

struct TopLevelObject: Codable {
    let secondLevelObject: [Colleges]
}
struct Colleges: Codable {
    let collegeId: String
    let collegeUnitId: String
    let name: String
    let website: String
    let shortDescription: String
    let longDescription: String
    let campusImage: String
    let city: String
    let stateAbbr: String
    let roomAndBoard: String
    let acceptanceRate: String
    let privatePublic: String
    let raceEthnicity: String
    let similarColleges: String
}

// Website - website { label hyperlink }
// ShortDescription - short_description
// LongDescription - long_description
// CampusImage - campus_image
// City - city
// State Abbr - state_abbr
// Room & Board - typical_room_and_board
// Acceptance Rate - acceptance_rate
// Private/Public - type_category
// Race & Ethnicity - student_percentage_race_ethnicity { text view }
// Similar Colleges - similar_colleges

enum CodingKeys: String, CodingKey {
    
    case website = "website"
    case shortDescription = "short_description"
    case longDescription = "long_description"
    case campusImage = "campus_image"
    case stateAbbr = "state_abbr"
    case roomAndBoard = "typical_room_and_board"
    case acceptanceRate = "acceptance_rate"
    case privatePublic = "type_category"
    case raceEthnicity = "student_percentage_race_ethnicity"
    case similarColleges = "similar_colleges"
}
