//
//  MoviesListIntegrationTest.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import XCTest
@testable import Small_World_Assessment

class MoviesListIntegrationTest: XCTestCase {
    func testSuccessIntegration() {
        let repository = MoviesRepository(moviesAPICalls: FakeSuccessMoviesListAPICalls())
        let useCase = GetMoviesListUseCase(repo: repository)
        let viewModel = MovieVCViewModel(useCase: useCase)
        viewModel.getMoviesList()
        XCTAssert(viewModel.getUIModelsCount() == 3)
        XCTAssert(viewModel.getUIModel(atIndex: 1)?.title == "Harry Potter 2")
    }
    
    func testFailureIntegration() {
        let repository = MoviesRepository(moviesAPICalls: FakeFailureMoviesListAPICalls())
        let useCase = GetMoviesListUseCase(repo: repository)
        let viewModel = MovieVCViewModel(useCase: useCase)
        viewModel.getMoviesList()
        XCTAssert(viewModel.getUIModelsCount() == 0)
    }
}
