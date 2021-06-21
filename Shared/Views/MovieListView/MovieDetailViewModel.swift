//
//  MovieDetailViewModel.swift
//  Flix
//
//  Created by Conrad Taylor on 6/20/21.
//

import Foundation
import Apollo

final class MovieDetailViewModel: ObservableObject {
  @Published var movie: MovieDetailQuery.Data.Movie?
  @Published var isLoading = false
  //  @Published var alertItem: AlertItem?
  
  func getMovie(id: GraphQLID) {
    isLoading = true
    
    Network.shared.apollo
      .fetch(query: MovieDetailQuery(id: id)) { [weak self] result in
        DispatchQueue.main.async {
          self?.isLoading = false
          
          switch result {
          case .success(let graphQLResult):
            if let movie = graphQLResult.data?.movie {
              self?.movie = movie
            }
            
          case .failure(let error):
            print(error)
            
          }
        }
      }
  }
}
