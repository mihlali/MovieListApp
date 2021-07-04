//
//  MovieViewModel.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/06/29.
//

import Foundation
import UIKit

protocol MovieListDelegate: AnyObject {
    func refreshView()
}

struct MovieGenerSection {
    var sectionTitle: String!
    var movies: [Movie]!
}

class MoviesListViewModel {
    
    private var interactor: FetchMoviesInteractor
    private weak var delegate: MovieListDelegate?
    var tableViewScetions = [MovieGenerSection]()
    var moviesModelList = [Movie]()
    
    init(delegate: MovieListDelegate) {
        self.delegate = delegate
        self.interactor = FetchMoviesInteractor()
    }
    
    func fetchMovie(movieName: String = "") {
        interactor.fetchMoviesList(searchString: movieName) { [weak self] (response) in
            switch response {
            case.success(let moviesResponse):
                self?.moviesModelList = moviesResponse.movies
                self?.createArrayOfDictionaries()
                self?.delegate?.refreshView()
            case.failure(let error):
                print(error)
            }
        }
    }
    
    var genreTypes: [String] {
        var generSet = Set<String>()
        for movie in moviesModelList {
            for index in 0..<movie.genres.count {
                generSet.insert(movie.genres[index])
            }
        }
        return Array(generSet)
    }
    
    private func createArrayOfDictionaries() {
        guard !genreTypes.isEmpty else {
            return
        }
        
        for genre in genreTypes {
            let sameGenereMovies = moviesModelList.filter({$0.genres.contains(genre)})
            tableViewScetions.append(MovieGenerSection(sectionTitle: genre, movies: sameGenereMovies))
        }
    }
}
