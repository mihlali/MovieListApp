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
        
        let createdURL = searchString.isEmpty ? creatURlwithOutQuery() : createURlWithQuery(query: searchString)
        
        guard let url = createdURL else {
            completion((.failure(.badURL)))
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
    
    private func createURlWithQuery(query: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "wookie.codesubmit.io"
        components.path = "/movies"
        components.queryItems = [
            URLQueryItem(name: "q", value: query),
        ]
        guard let url = components.url else {
            return nil
        }
        return url
    }
    
    private func creatURlwithOutQuery() -> URL? {
        guard let url = URL(string: "https://wookie.codesubmit.io/movies") else {
            return nil
        }
        return url
    }
}
