//
//  GetMovieDetailsUseCaseTest.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import XCTest
@testable import Small_World_Assessment

class GetMovieDetailsUseCaseTest: XCTestCase {
    func testFetchDataSuccessCase() {
        let repository = MoviesRepository(moviesAPICalls: FakeSuccessMovieDetailsAPICalls())
        let useCase = GetMovieDetailsUseCase(repo: repository)
        useCase.execute(withMovieId: 1) { result in
            switch result {
            case .success(let data):
                XCTAssert(data.title == "Harry Potter")
            case .failure(_):
                break
            }
        }
    }
    
    func testFetchDataFailureCAse() {
        let repository = MoviesRepository(moviesAPICalls: FakeFailureMoviesDetailsAPICalls())
        let useCase = GetMovieDetailsUseCase(repo: repository)
        useCase.execute(withMovieId: 1) { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                XCTAssert(error.localizedDescription == Constants.NetworkCallError.wentWrong.rawValue)
            }
        }
    }

}
