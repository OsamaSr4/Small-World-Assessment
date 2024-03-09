//
//  MoviesDetailsIntegrationTest.swift
//  YassirCSTests
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import XCTest
@testable import Small_World_Assessment

class MoviesDetailsIntegrationTest: XCTestCase {
    func testSuccessIntegration() {
        let repository = MoviesRepository(moviesAPICalls: FakeSuccessMovieDetailsAPICalls())
        let useCase = GetMovieDetailsUseCase(repo: repository)
        let viewModel = MovieDetailsViewModel(useCase: useCase,
                                              movieId: 1)
        viewModel.getDetails()
        XCTAssert(viewModel.getTitle() == "Harry Potter")
        XCTAssert(viewModel.getDate() == "2022-06-24")
    }
    
    func testFailureIntegration() {
        let repository = MoviesRepository(moviesAPICalls: FakeFailureMoviesDetailsAPICalls())
        let useCase = GetMovieDetailsUseCase(repo: repository)
        let viewModel = MovieDetailsViewModel(useCase: useCase, movieId: 1)
        viewModel.getDetails()
        XCTAssert(viewModel.getTitle() == "")
        XCTAssert(viewModel.getDate() == "")
    }
}
