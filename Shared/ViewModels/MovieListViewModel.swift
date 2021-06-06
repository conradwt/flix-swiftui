//
//  MovieListViewModel.swift
//  Flix
//
//  Created by Conrad Taylor on 5/29/21.
//

import Foundation

final class MovieListViewModel: ObservableObject {
  @Published var state: ViewStatus = .none
  @Published var movies = [Movie]()
  
  private let repository: MovieRepositoryProtocol
  
  init(repository: MovieRepositoryProtocol = MovieRepository()) {
    self.repository = repository
  }
  
  func onAppear() {
    state = .loading
    
    repository.fetchMovies { movies in
      guard let movies = movies else {
        self.state = .error
        return
      }
        
      self.movies = movies
      self.state = .complete
    }
  }
  
  
//  init() {
//    setup()
//  }
//
//  func setup() {
//
//    state = .loading
//
//    repo.getEpisodes { episodes in
//      guard let episodes = episodes else {
//        self.state = .error
//        return
//      }
//
//      self.episodes = episodes
//      self.state = .complete
//
//    }
//  }
}
