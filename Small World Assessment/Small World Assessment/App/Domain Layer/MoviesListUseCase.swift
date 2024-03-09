//
//  MoviesListUseCase.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

protocol GetMoviesListUseCaseProtocol {
    func execute(page:Int,completion: @escaping (Result<MovieListResponse, BaseError>) -> Void)
}

class GetMoviesListUseCase: GetMoviesListUseCaseProtocol {
    private let repo: Repo_Movie_List_Protocol
    
    init(repo: Repo_Movie_List_Protocol) {
        self.repo = repo
    }
    
    func execute(page: Int, completion: @escaping (Result<MovieListResponse, BaseError>) -> Void) {
        self.repo.getMoviesList(page: page) { (result) in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
