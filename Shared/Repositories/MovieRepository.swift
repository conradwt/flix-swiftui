//
//  MovieRepository.swift
//  Flix (iOS)
//
//  Created by Conrad Taylor on 6/5/21.
//

import Foundation

protocol MovieRepositoryProtocol {
  func fetchMovie(id: String, completion: @escaping (Movie?) -> Void)
  func fetchMovies(completion: @escaping ([Movie]?) -> Void)
}

final class MovieRepository: MovieRepositoryProtocol {
  private let apiService: MovieApiServiceProtocol
  // private let storageService: MovieStorageServiceProtocol e.g. Core Data, UserDefaults, and so on
  
  init(apiService: MovieApiServiceProtocol = MovieApiService()) {
    self.apiService = apiService
  }
  
  func fetchMovie(id: String, completion: @escaping (Movie?) -> Void) {
    apiService.fetchMovie(id: id, completion: completion)
  }
  
  func fetchMovies(completion: @escaping ([Movie]?) -> Void) {
    apiService.fetchMovies(completion: completion)
  }
}
