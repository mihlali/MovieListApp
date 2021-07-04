//
//  FetchMoviesInteractor.swift
//  MovieListingAPP
//
//  Created by Mihlali Mazomba on 2021/06/28.
//

import Foundation

enum serviceError: Error {
    case badURL
    case requestError
    case corruptData
}

typealias fetchMoviesSuccess = (Result< Movies, serviceError>) -> Void

class FetchMoviesInteractor {
    
    func fetchMoviesList(searchString: String, completion: @escaping fetchMoviesSuccess) {
        
        let urlString = searchString.isEmpty ? "https://wookie.codesubmit.io/movies": "https://wookie.codesubmit.io/movies?q=\(searchString)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer Wookie2019"
        ]
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.requestError))
                return
            }
            
            guard let _ = response else {
                return  // handle data
            }
            
            guard let data = data else {
                completion(.failure(.corruptData))
                return
            }
            
            let decodedMovies = try? JSONDecoder().decode(Movies.self, from: data)
            completion(.success(decodedMovies ?? Movies()))
        }.resume()
    }
}
