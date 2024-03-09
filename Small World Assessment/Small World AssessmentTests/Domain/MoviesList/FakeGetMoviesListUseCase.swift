//
//  FakeGetMoviesListUseCase.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import Foundation
@testable import Small_World_Assessment

class FakeGetMoviesListSuccessUseCase: GetMoviesListUseCaseProtocol{
    func execute(page: Int, completion: @escaping (Result<Small_World_Assessment.MovieListResponse, Small_World_Assessment.BaseError>) -> Void) {
        completion(.success(FakeData.FakeListData.makeFakeSuccessData()))
    }
    
}

class FakeGetMoviesListFailureUseCase: GetMoviesListUseCaseProtocol {
    func execute(page: Int, completion: @escaping (Result<Small_World_Assessment.MovieListResponse, Small_World_Assessment.BaseError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
    
}
