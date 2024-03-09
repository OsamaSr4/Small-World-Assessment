//
//  MovieDetailsUseCase.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation
import Foundation

protocol GetMovieDetailsUseCaseProtocol {
    func execute(withMovieId id: Int,
                 completion: @escaping (Result<MovieDetails, BaseError>) -> Void)
}

class GetMovieDetailsUseCase: GetMovieDetailsUseCaseProtocol {
    private let repo: Repo_Movies_Details_Protocol
    
    init(repo: Repo_Movies_Details_Protocol) {
        self.repo = repo
    }
    
    func execute(withMovieId id: Int,
                 completion: @escaping (Result<MovieDetails, BaseError>) -> Void) {
        self.repo.getMovieDetails(withId: id) { (result) in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
