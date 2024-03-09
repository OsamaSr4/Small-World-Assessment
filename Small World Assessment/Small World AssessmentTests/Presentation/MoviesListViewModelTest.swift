//
//  MoviesListViewModelTest.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import XCTest
@testable import Small_World_Assessment

class MoviesListViewModelTest: XCTestCase {
    
    func testSuccessCase() {
        let viewModel = MovieVCViewModel(useCase: FakeGetMoviesListSuccessUseCase())
        viewModel.getMoviesList()
        XCTAssert(viewModel.getUIModelsCount() == 3)
        XCTAssert(viewModel.getUIModel(atIndex: 1)?.title == "Harry Potter 2")
    }
    
    func testFailureCase() {
        let viewModel = MovieVCViewModel(useCase: FakeGetMoviesListFailureUseCase())
        viewModel.getMoviesList()
        XCTAssert(viewModel.getUIModelsCount() == 0)
    }

}
