//
//  FakeMoviesAPICalls.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation
@testable import Small_World_Assessment

///LIST API
class FakeSuccessMoviesListAPICalls: GetMoviesListApiProtocol {
    func getMovies(page: Int, completion: @escaping (Result<Small_World_Assessment.MovieListResponse, Small_World_Assessment.BaseError>) -> Void) {
        completion(.success(FakeData.FakeListData.makeFakeSuccessData()))
    }

}

class FakeFailureMoviesListAPICalls: GetMoviesListApiProtocol {
    func getMovies(page: Int, completion: @escaping (Result<Small_World_Assessment.MovieListResponse, Small_World_Assessment.BaseError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
}


///DETAILS API
class FakeSuccessMovieDetailsAPICalls: GetMovieDetailsApiProtocol {
    func getMovieDetails(withId id: Int,
                         completion: @escaping (Result<MovieDetails, BaseError>) -> Void) {
        completion(.success(FakeData.FakeDetailsData.makeFakeSuccessData()))
    }
}

class FakeFailureMoviesDetailsAPICalls: GetMovieDetailsApiProtocol {
    func getMovieDetails(withId id: Int,
                         completion: @escaping (Result<MovieDetails, BaseError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
}
