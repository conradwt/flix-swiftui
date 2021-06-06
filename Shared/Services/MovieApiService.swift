//
//  MovieApiService.swift
//  Flix (iOS)
//
//  Created by Conrad Taylor on 6/5/21.
//

import Foundation

protocol MovieApiServiceProtocol {
  func fetchMovie(id: String, completion: @escaping (Movie?) -> Void)
  func fetchMovies(completion: @escaping ([Movie]?) -> Void)
}

final class MovieApiService: MovieApiServiceProtocol {
  func fetchMovie(id: String, completion: @escaping (Movie?) -> Void) {
    Network.shared.apollo.fetch(query: MovieDetailQuery(id: id), cachePolicy: .fetchIgnoringCacheCompletely) { result in
      
      switch result {
      
      case .failure(let error):
        print(error.localizedDescription)
        completion(nil)
        
      case .success(let data):
        let model = data.data?.movie?.decodeModel(type: Movie.self)
        completion(model)
      }
      
    }
  }
  
  func fetchMovies(completion: @escaping ([Movie]?) -> Void) {
    Network.shared.apollo.fetch(query: MovieListQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
      
      switch result {
      
      case .failure(let error):
        print(error.localizedDescription)
        completion(nil)
        
      case .success(let data):
        let model = data.data?.movies?.decodeModel(type: MoviesResponse.self)
        completion(model?.results)
      }
      
    }
  }
}
