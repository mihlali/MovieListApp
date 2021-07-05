//
//  SearchingViewModel.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/04.
//

import Foundation

protocol SearchDelegate: NSObjectProtocol {
    func refreshViewFor()
}

class SearchingViewModel {
    
    private var interactor: FetchMoviesInteractor
    private weak var delegate: SearchDelegate?
    var searchedMovies = [Movie]()
    var selectedMovie = Movie()
    
    init(delegate: SearchDelegate) {
        interactor = FetchMoviesInteractor()
        self.delegate = delegate
    }
    
    func fetchMovie(withName movieName:String) {
        interactor.fetchMoviesList(searchString: movieName) { [weak self] (response) in
            switch response {
            case.success(let response):
                self?.searchedMovies = response.movies
                self?.delegate?.refreshViewFor()
            case.failure(let error):
                print(error)
            }
        }
    }
}
