//
//  SearchingViewModel.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/04.
//

import Foundation

protocol SearchDelegate: NSObjectProtocol {
    func refreshViewFor(isSuccess: Bool, message: String?)
}

class SearchingViewModel {
    
    private var interactor: MovieProtocol
    private weak var delegate: SearchDelegate?
    var searchedMovies = [Movie]()
    var selectedMovie = Movie()
    
    init(delegate: SearchDelegate,
         interactor: MovieProtocol ) {
        self.interactor = interactor
        self.delegate = delegate
    }
    
    func fetchMovie(withName movieName:String) {
        interactor.fetchMoviesList(searchString: movieName) { [weak self] (response) in
            switch response {
            case.success(let response):
                self?.searchedMovies = response.movies
                self?.delegate?.refreshViewFor(isSuccess: true, message: nil)
            case.failure(let error):
                self?.delegate?.refreshViewFor(isSuccess: false, message: error.localizedDescription)
            }
        }
    }
}
