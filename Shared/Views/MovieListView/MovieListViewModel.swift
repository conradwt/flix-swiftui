//
//  MovieListViewModel.swift
//  Flix
//
//  Created by Conrad Taylor on 5/29/21.
//

import Foundation

final class MovieListViewModel: ObservableObject {
  @Published var movies = [GetMoviesQuery.Data.Movie]()
  @Published var isLoading = false
//  @Published var alertItem: AlertItem?
  
  func getMovies() {
    isLoading = true
    
    Network.shared.apollo
      .fetch(query: GetMoviesQuery()) { [weak self] result in
        DispatchQueue.main.async {
          self?.isLoading = false
          
          switch result {
          case .success(let graphQLResult):
            if let movies = graphQLResult.data?.movies {
              self?.movies = movies as! [GetMoviesQuery.Data.Movie]
            }
            
          case .failure(let error):
            print(error)
      
          }
        }
    }
  }
}
