//
//  FakeGetMovieDetailsSuccessUseCase.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation
@testable import Small_World_Assessment

class FakeGetMovieDetailsSuccessUseCase: GetMovieDetailsUseCaseProtocol{
    func execute(withMovieId id: Int, completion: @escaping (Result<MovieDetails, BaseError>) -> Void) {
        completion(.success(FakeData.FakeDetailsData.makeFakeSuccessData()))
    }
}

class FakeGetMoviesDetailsFailureUseCase: GetMovieDetailsUseCaseProtocol {
    func execute(withMovieId id: Int, completion: @escaping (Result<MovieDetails, BaseError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
}
