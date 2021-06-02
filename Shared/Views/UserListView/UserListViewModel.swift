//
//  FanListViewModel.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import Foundation

final class UserListViewModel: ObservableObject {
  @Published var users = [GetUsersQuery.Data.User]()
  @Published var isLoading = false
  //  @Published var alertItem: AlertItem?
  
  func getUsers() {
    isLoading = true
    
    Network.shared.apollo
      .fetch(query: GetUsersQuery()) { [weak self] result in
        DispatchQueue.main.async {
          self?.isLoading = false
          
          switch result {
          case .success(let graphQLResult):
            if let users = graphQLResult.data?.users {
              self?.users = users as! [GetUsersQuery.Data.User]
            }
            
          case .failure(let error):
            print(error)
            
          }
        }
      }
  }
}
