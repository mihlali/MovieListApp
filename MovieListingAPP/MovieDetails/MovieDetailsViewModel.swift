//
//  MovieDetailsViewModel.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/07/04.
//

import Foundation

struct  MovieDetailsViewModel {
    
    private var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var posterTitle: String {
        return "\(movie.title) (\(movie.rating ))"
    }
    
    var yearLengthDirector: String {
        return "\(yearMovieReleased) |\(movie.length) | \(movie.director)"
    }
    
    var cast: String {
        return "Cast: \(movie.cast.map{String($0)}.joined(separator: ","))"
    }
    
    var description: String {
        return "movie description: \(movie.overview)"
    }
    
    var backDropimageURl: String {
        return movie.backdropImageURL
    }
    
    var posterImageURL: String {
        return movie.posterURL
    }
    
    private var yearMovieReleased: String {
        let date = Date().date(fromString: movie.releaseDate)
        return date.getYearOnDate()
    }
}
