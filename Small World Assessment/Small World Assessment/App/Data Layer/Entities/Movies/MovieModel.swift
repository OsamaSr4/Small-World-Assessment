//
//  MovieModel.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

struct MovieModel: Codable {
    var id: Int
    var title: String = ""
    var description: String = ""
    var releaseDate: String = ""
    var posterPath: String = ""
    var thumbImage: String  {
        return "\(Constants.Media.baseURL.rawValue)\(Constants.Media.AppendingURL.thumbSize.rawValue)\(posterPath)"
    }
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "overview"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }

}
