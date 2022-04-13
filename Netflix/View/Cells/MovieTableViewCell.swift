//
//  MovieTableViewCell.swift
//  Netflix
//
//  Created by Essam Orabi on 12/04/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var moviewImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(data: Movie) {
        moviewImage.roundCorners([.layerMinXMinYCorner, .layerMinXMaxYCorner], radius: 5)
        movieNameLabel.text = data.originalTitle
        movieDateLabel.text = data.releaseDate
        guard let posterPath = data.posterPath else {return}
        let imagePath = "https://image.tmdb.org/t/p/w500/" + posterPath
        moviewImage.loadImageFromUrl(imgUrl: imagePath, defString: "placeholder")
    }
}
