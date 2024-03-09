//
//  MovieDetailsViewModelTest.swift
//  YassirCS
//
//  Created by Muhammad Ahmed Baig on 13/10/2022.
//

import XCTest
@testable import Small_World_Assessment

class MovieDetailsViewModelTest: XCTestCase {

    func testSuccessCase() {
        let viewModel = MovieDetailsViewModel(useCase: FakeGetMovieDetailsSuccessUseCase(), movieId: 1)
        viewModel.getDetails()
        XCTAssert(viewModel.getTitle() == "Harry Potter")
    }
    
    func testFailureCase() {
        let viewModel = MovieDetailsViewModel(useCase: FakeGetMoviesDetailsFailureUseCase(), movieId: 1)
        viewModel.getDetails()
        XCTAssert(viewModel.getTitle() == "")
    }

}
