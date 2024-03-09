//
//  Constants.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation
import UIKit
enum Constants {
    enum StoryBoards {
        static let main = UIStoryboard(name: "Main", bundle: nil)
    }
    
    enum API: String {
        case baseURL = "https://api.themoviedb.org/3/"
        case key = "3ef0b5fded27d35a17414b6ce22b2c3c"
        enum QueryParam: String {
            case apiKeyParam = "api_key"
        }
        enum EndPoints: String {
            case discoverMovies = "/movie/popular"
            case details = "/movie/"
        }
    }
    
    enum Media: String {
        case baseURL = "https://image.tmdb.org/t/p/"
        enum AppendingURL: String {
            case originalSize = "original"
            case thumbSize = "w300"
        }
    }
    
    enum NetworkCallError: String {
        case wentWrong = "Something went wrong, please try again later."
        case parsingError = "Unable to parse data."
    }
    
    enum Error: String {
        case invalidURL = "URL seems to be not correct."
    }
    
    enum ScreenTitle: String {
        case homeTitle = "Trending Movies"
        case detailsTitle = "Movie Details"
    }
}
