//
//  MovieResponseModel.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation


struct MovieListResponse: BaseResponse, Codable {
    var code: Int?
    var message: String?
    var succes: Bool?
    var result: [MovieModel] = []
    var totalPages: Int?
    var page: Int?

    enum CodingKeys: String, CodingKey{
        case result = "results"
        case page = "page"
        case totalPages = "total_pages"
    }

}
