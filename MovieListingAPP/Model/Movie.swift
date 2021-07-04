//
//  Movie.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/06/28.
//

import Foundation
import UIKit

struct Movies: Codable {
    var movies = [Movie]()
}

struct Movie: Codable {
    
    var backdropImageURL = ""
    var cast = [String]()
    var classification = ""
    var director = ""
    var genres = [String]()
    var rating = 0.0
    var length = ""
    var overview = ""
    var posterURL = ""
    var releaseDate = ""
    var slug = ""
    var title = ""
    var posterImage = UIImage()
    var backdropImage = UIImage()
    
     enum CodingKeys : String, CodingKey {
        case backdropImageURL = "backdrop"
        case cast
        case classification
        case genres
        case rating = "imdb_rating"
        case length
        case overview
        case posterURL = "poster"
        case releaseDate = "released_on"
        case slug
        case title
    }
}
