//
//  MovieDetailsViewController.swift
//  Netflix
//
//  Created by Essam Orabi on 13/04/2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var moviewOverViewLabel: UILabel!

    var movieId = 0
    var movieDetailsViewModelVM = MovieDetailsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }

    func loadData() {
        movieDetailsViewModelVM.getMovieDetails(movieId: movieId) { (errMsg, errRes, status) in
            switch status {
            case .populated:
                self.setupView()
            case .error:
                self.alert(message: errMsg ?? "", title: "Error")
            default:
                break
            }
        }
    }

    func setupView() {
        guard let movieDetails = movieDetailsViewModelVM.detailsResult else {return}
        movieTitleLabel.text = movieDetails.originalTitle
        movieReleaseDateLabel.text = movieDetails.releaseDate
        moviewOverViewLabel.text = movieDetails.overview
        guard let posterPath = movieDetails.posterPath else {return}
        let imagePath = "https://image.tmdb.org/t/p/w500/" + posterPath
        movieImage.loadImageFromUrl(imgUrl: imagePath, defString: "placeholder")
    }
}
