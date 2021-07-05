//
//  ViewController.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/06/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    private lazy var viewModel = MoviesListViewModel(delegate: self,
                                                     interactor: FetchMoviesInteractor())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GenreTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        viewModel.fetchMovie()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "movieDetailsSegue" {
            let detailsViewController = segue.destination as! MovieDetailViewController
            detailsViewController.set(movie: viewModel.selectedMovie)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.genreTypes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.genreTypes[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! GenreTableViewCell
        cell.populateViewWith(movies: viewModel.tableViewScetions[indexPath.section].movies)
        cell.set(delegate: self)
        return cell
    }
    
}

extension ViewController: MovieListDelegate {
    func refreshView() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
}

extension ViewController: collectionViewCellDelegate {
    func collectionViewCellTapped(at index: Int, selectedMovie movie: Movie) {
        viewModel.selectedMovie = movie
        performSegue(withIdentifier: "movieDetailsSegue", sender: self)
    }
}

