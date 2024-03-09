//
//  MoviesTableViewCell.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import UIKit

class MoviesTableViewCell: UITableViewCell, IdentifiableProtocol {
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(fromModel uiModel: MovieUIModel) {
        self.movieImage.setImage(from: uiModel.mediaURL)
        self.movieDate.text = uiModel.releaseDate
        self.movieName.text = uiModel.title
    }
}
