//
//  MoviesDetails.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

struct MovieDetails: BaseResponse , Decodable {
    var code: Int?
    var message: String?
    var succes: Bool?
    var id: Int?
    var title: String = ""
    var homepageLink: String = ""
    var description: String = ""
    var releaseDate: String = ""
    var posterPath: String = ""
    var posterImage: String {
       return "\(Constants.Media.baseURL.rawValue)\(Constants.Media.AppendingURL.originalSize.rawValue)\(posterPath)"
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case homepageLink = "homepage"
        case description = "overview"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}
