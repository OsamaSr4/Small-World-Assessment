//
//  MoviesRepository.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

//MARK: Initilizing Repo using depenceny inversion for the specific api call

class MoviesRepository {
    private var moviesAPIs: APICallsProtocol

    //MARK: for list of the movie
    init(moviesAPICalls: GetMoviesListApiProtocol) {
        self.moviesAPIs = moviesAPICalls
    }
    //MARK: for deatils of the movie
    init(moviesAPICalls: GetMovieDetailsApiProtocol) {
        self.moviesAPIs = moviesAPICalls
    }

}

//MARK: For Getting Movies List
protocol Repo_Movie_List_Protocol {
    func getMoviesList(page: Int,completion: @escaping (Result<MovieListResponse, BaseError>) -> Void)
}
extension MoviesRepository :  Repo_Movie_List_Protocol {
    func getMoviesList(page:Int,completion: @escaping (Result<MovieListResponse, BaseError>) -> Void) {
        (self.moviesAPIs as! GetMoviesListApiProtocol).getMovies(page: page, completion: completion)
    }
    
}


//MARK: For Getting Movies Details
protocol Repo_Movies_Details_Protocol {
    func getMovieDetails(withId id: Int,
                          completion: @escaping (Result<MovieDetails, BaseError>) -> Void)
}
extension MoviesRepository : Repo_Movies_Details_Protocol {
    func getMovieDetails(withId id: Int,
                          completion: @escaping (Result<MovieDetails, BaseError>) -> Void) {
        (self.moviesAPIs as! GetMovieDetailsApiProtocol).getMovieDetails(withId: id, completion: completion)
    }
}
