//
//  AppCoordinator.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation
import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = Constants.StoryBoards.main.instantiateViewController(withIdentifier: MoviesViewController.getIdentifier()) as! MoviesViewController
        vc.initilizeController(viewModel: self.makeMoviesListViewModel())
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func makeMoviesListViewModel() -> MovieVCViewModel {
        return MovieVCViewModel(useCase: makeGetMoviesListUseCase())
    }
    
    private func makeGetMoviesListUseCase() -> GetMoviesListUseCaseProtocol {
        return GetMoviesListUseCase(repo: makeMoviesRepository())
    }
    
    private func makeMoviesRepository() -> Repo_Movie_List_Protocol {
        return MoviesRepository(moviesAPICalls: makeAPICallsRepo())
    }
    
    private func makeAPICallsRepo() -> GetMoviesListApiProtocol {
        return APICalls()
    }
    
    func showMovieDetails(withMovieId id: Int) {
        let coordinator = MovieDetailsCoordinator(navigationController: navigationController,
                                                  dependencies: MovieDetailsCoordinator.Dependencies(movieId: id))
        coordinator.start()
    }
}
