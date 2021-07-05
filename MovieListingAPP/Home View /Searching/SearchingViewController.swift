//
//  SearchingViewController.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/04.
//

import UIKit

class SearchingViewController: UIViewController {
    
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var searchTableView: UITableView!
    private let searchController = UISearchController()
    private lazy var viewModel = SearchingViewModel(delegate: self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        title = "Search"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        loadTableViewNib()
    }
    
    private func loadTableViewNib() {
        searchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil),
                                 forCellReuseIdentifier: "searchCell")
        searchTableView?.translatesAutoresizingMaskIntoConstraints = false

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "DetailsSegue" {
            let detailsViewController = segue.destination as! MovieDetailViewController
            detailsViewController.set(movie: viewModel.selectedMovie)
        }
    }
}

extension SearchingViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        activityIndicator.startAnimating()
        guard let searchString = searchBar.text else {
            return
        }
        viewModel.fetchMovie(withName: searchString)
    }
}

extension SearchingViewController: SearchDelegate {
    func refreshViewFor() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.searchTableView.reloadData()
        }
        
        if viewModel.searchedMovies.isEmpty {
            AlertView.showAlert(view: self, message: "Cannot find movies with that name", title: "No movies found")
        }
    }
}

extension SearchingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchedMovies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchTableViewCell
        let movie = viewModel.searchedMovies[indexPath.row]
        cell.populateCell(with: movie.title , imageURl: movie.posterURL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedMovie = viewModel.searchedMovies[indexPath.row]
        performSegue(withIdentifier: "DetailsSegue", sender: self)
    }
}
