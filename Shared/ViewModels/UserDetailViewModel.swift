//
//  UserDetailViewModel.swift
//  Flix
//
//  Created by Conrad Taylor on 6/3/21.
//

import Foundation
import Apollo

final class UserDetailViewModel: ObservableObject {
  @Published var state: ViewStatus = .none
  @Published var user: User?
  
  private let repository: UserRepositoryProtocol
  
  init(repository: UserRepositoryProtocol = UserRepository()) {
    self.repository = repository
  }
  
  func onAppear(userId: String) {
    state = .loading
    
    repository.fetchUser(id: userId) { user in
      guard let user = user else {
        self.state = .error
        return
      }
      
      self.user = user
      self.state = .complete
    }
  }
}
