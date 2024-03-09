//
//  MovieVCViewModel.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

struct MovieUIModel {
    var id: Int
    var title: String
    var description: String
    var releaseDate: String
    var mediaURL: String
}

protocol MoviesListVMDelegate: AnyObject {
    func sucessWhileFetchingData()
    func show(error msg: String)
    func moveToDetails(withMovieId id: Int)
}

class MovieVCViewModel {
    weak var delegate: MoviesListVMDelegate?
    private var useCase: GetMoviesListUseCaseProtocol
    private var uiModels = [MovieUIModel]()
    
    
    init(useCase: GetMoviesListUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getMoviesList() {
        self.useCase.execute(page:1) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let moviesList):
                self.makeUIModels(moviesList: moviesList)
            case .failure(let error):
                self.delegate?.show(error: error.localizedDescription)
            }
        }
    }
    
    private func makeUIModels(moviesList: MovieListResponse) {
        for movie in moviesList.result {
            uiModels.append(MovieUIModel(id: movie.id,
                                         title: movie.title,
                                         description: movie.description,
                                         releaseDate: movie.releaseDate,
                                         mediaURL: movie.thumbImage))
        }
        self.delegate?.sucessWhileFetchingData()
    }
    
    
    func didTapOnItem(atIndex index: Int) {
        self.delegate?.moveToDetails(withMovieId: uiModels[index].id)
    }
    
    
    func getUIModelsCount() -> Int {
        return uiModels.count 
    }
    
    func getUIModel(atIndex index: Int) -> MovieUIModel? {
        return uiModels.count > index ? uiModels[index] : nil
    }
    
}
