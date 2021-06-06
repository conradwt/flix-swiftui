//
//  MovieViewModel.swift
//  Flix
//
//  Created by Conrad Taylor on 6/2/21.
//

import Foundation
import Apollo

//
// https://www.apollographql.com/docs/ios/tutorial/tutorial-detail-view
//

final class MovieDetailViewModel: ObservableObject {
  @Published var state: ViewStatus = .none
  @Published var movie: Movie?
  
  private let repository: MovieRepositoryProtocol
  
  init(repository: MovieRepositoryProtocol = MovieRepository()) {
    self.repository = repository
  }
  
  func onAppear(movieId: String) {
    state = .loading
    
    repository.fetchMovie(id: movieId) { movie in
      guard let movie = movie else {
        self.state = .error
        return
      }
      
      self.movie = movie
      self.state = .complete
    }
  }
}
