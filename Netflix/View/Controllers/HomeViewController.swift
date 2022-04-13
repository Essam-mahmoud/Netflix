//
//  ViewController.swift
//  Netflix
//
//  Created by Essam Orabi on 12/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    let movieCellName = "MovieTableViewCell"
    var homeVM = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setupView()
        loadData()
        // Do any additional setup after loading the view.
    }

    func registerXib() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(UINib(nibName: movieCellName, bundle: nil), forCellReuseIdentifier: movieCellName)
    }

    func setupView() {
        let headerView = TopDashBoardView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        moviesTableView.tableHeaderView = headerView
        setupNavigation()
        tabBarController?.tabBar.tintColor = .label
    }

    func setupNavigation() {
        var image = UIImage(named: "netflix1")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }

    func loadData() {
        homeVM.getMovies { (errMsg, errRes, status) in
            switch status {
            case .populated:
                self.moviesTableView.reloadData()
            case .error:
                self.alert(message: errMsg ?? "", title: "Error")
            default:
                break
            }
        }
    }
}




