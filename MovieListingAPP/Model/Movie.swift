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
    
    var backdropImageURL: String?
    var cast: [String]?
    var classification: String?
    var director: String?
    var genres: [String]
    var rating: Double?
    var length: String
    var overview: String
    var posterURL: String
    var releaseDate: String
    var slug: String
    var title: String
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
