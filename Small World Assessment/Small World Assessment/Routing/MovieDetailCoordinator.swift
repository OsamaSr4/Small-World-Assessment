//
//  MovieDetailCoordinator.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation
import UIKit

class MovieDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var dependencies: Dependencies
    
    struct Dependencies {
        var movieId: Int
    }

    init(navigationController: UINavigationController,
         dependencies: Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let vc = Constants.StoryBoards.main.instantiateViewController(withIdentifier: MovieDetailsViewController.getIdentifier()) as! MovieDetailsViewController
        vc.initilizeController(viewModel: self.makeMovieDetailsViewModel())
        DispatchQueue.main.async {
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    private func makeMovieDetailsViewModel() -> MovieDetailsViewModel {
        return MovieDetailsViewModel(useCase: makeGetMovieDetailsUseCase(),
                                     movieId: dependencies.movieId)
    }
    
    private func makeGetMovieDetailsUseCase() -> GetMovieDetailsUseCaseProtocol {
        return GetMovieDetailsUseCase(repo: makeMoviesRepository())
    }
    
    private func makeMoviesRepository() -> Repo_Movies_Details_Protocol {
        return MoviesRepository(moviesAPICalls: makeAPICallsRepo())
    }
    
    private func makeAPICallsRepo() -> GetMovieDetailsApiProtocol {
        return APICalls()
    }
}
