//
//  MovieDetailsModel.swift
//  Netflix
//
//  Created by Essam Orabi on 13/04/2022.
//

import Foundation

// MARK: - Welcome
class MoviewDetails: Codable {
    let adult: Bool?
    let homepage: String?
    let id: Int?
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: String?
    let status, title: String?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case homepage = "homepage"
        case id = "id"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case status = "status"
        case title = "title"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}

