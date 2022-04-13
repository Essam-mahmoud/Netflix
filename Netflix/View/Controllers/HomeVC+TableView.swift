//
//  HomeVC+TableView.swift
//  Netflix
//
//  Created by Essam Orabi on 12/04/2022.
//

import UIKit
import SwiftUI

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeVM.MoviesResult?.results?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: movieCellName, for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        if let movie = homeVM.MoviesResult?.results?[indexPath.row] {
            cell.setupCell(data: movie)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let movie = homeVM.MoviesResult?.results?[indexPath.row] {
            let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
            detailsVC.movieId = movie.id ?? 0
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
