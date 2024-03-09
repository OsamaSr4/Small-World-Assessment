//
//  MovieDetailsViewController.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import UIKit

class MovieDetailsViewController: UIViewController ,IdentifiableProtocol{
   
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieDescription: UILabel!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchData()
    }
    
    var viewModel: MovieDetailsViewModel?
    
    func initilizeController(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        self.viewModel?.delegate = self
    }

    override func viewDidLayoutSubviews() {
        self.movieImage.roundBottomCorners(radius: 20)
    }
    private func fetchData() {
        viewModel?.getDetails()
    }
}

extension MovieDetailsViewController:MovieDetailsVMDelegate,Alertable{
    func successWhileFetching(movieDetails uiModel: MovieDetailsUIModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.movieTitle.text = uiModel.title
            self.movieDescription.text = uiModel.description
            self.movieImage.setImage(from: uiModel.mediaURL)
        }
    }
    
    func show(error msg: String) {
        self.showAlert(message: msg)
    }
    
}
