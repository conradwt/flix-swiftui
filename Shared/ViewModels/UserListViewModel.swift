//
//  FanListViewModel.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import Foundation

final class UserListViewModel: ObservableObject {
  @Published var state: ViewStatus = .none
  @Published var users = [User]()
  
  private let repository: UserRepositoryProtocol
  
  init(repository: UserRepositoryProtocol = UserRepository()) {
    self.repository = repository
  }
  
  func onAppear() {
    state = .loading
    
    repository.fetchUsers { users in
      guard let users = users else {
        self.state = .error
        return
      }
      
      self.users = users
      self.state = .complete
    }
  }
}
