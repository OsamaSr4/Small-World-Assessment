//
//  MoviesDetailViewModel.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import Foundation

protocol MovieDetailsVMDelegate: AnyObject {
    func successWhileFetching(movieDetails uiModel: MovieDetailsUIModel)
    func show(error msg: String)
}

struct MovieDetailsUIModel {
    var title: String
    var description: String
    var releaseDate: String
    var mediaURL: String
    var homepageLink: String
}

class MovieDetailsViewModel {
    
    weak var delegate: MovieDetailsVMDelegate?
    private var useCase: GetMovieDetailsUseCaseProtocol
    private var uiModel: MovieDetailsUIModel?
    private var movieId: Int
    
    init(useCase: GetMovieDetailsUseCaseProtocol,
         movieId id: Int) {
        self.useCase = useCase
        self.movieId = id
    }
    
    func getDetails() {
        self.useCase.execute(withMovieId: self.movieId) { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let details):
                self.makeUIModels(detailsModel: details)
            case .failure(let error):
                self.delegate?.show(error: error.localizedDescription)
            }
        }
    }
    
    private func makeUIModels(detailsModel model: MovieDetails) {
        self.uiModel = MovieDetailsUIModel(title: model.title,
                                           description: model.description,
                                           releaseDate: model.releaseDate,
                                           mediaURL: model.posterImage,
                                           homepageLink: model.homepageLink)
        self.delegate?.successWhileFetching(movieDetails: self.uiModel!)
    }
    
    func getTitle() -> String {
        return uiModel?.title ?? ""
    }
    
    func getDate() -> String {
        return uiModel?.releaseDate ?? ""
    }
    
    func getDescription() -> String {
        return uiModel?.description ?? ""
    }
    
    func getPosterImage() -> String {
        return uiModel?.mediaURL ?? ""
    }
    
}
