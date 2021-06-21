//
//  UserDetailViewModel.swift
//  Flix
//
//  Created by Conrad Taylor on 6/20/21.
//

import Foundation
import Apollo

final class UserDetailViewModel: ObservableObject {
  @Published var user: UserDetailQuery.Data.User?
  @Published var isLoading = false
  //  @Published var alertItem: AlertItem?
  
  func getUser(id: GraphQLID) {
    isLoading = true
    
    Network.shared.apollo
      .fetch(query: UserDetailQuery(id: id)) { [weak self] result in
        DispatchQueue.main.async {
          self?.isLoading = false
          
          switch result {
          case .success(let graphQLResult):
            if let user = graphQLResult.data?.user {
              self?.user = user
            }
            
          case .failure(let error):
            print(error)
            
          }
        }
      }
  }
}
