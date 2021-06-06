//
//  UserRepository.swift
//  Flix (iOS)
//
//  Created by Conrad Taylor on 6/5/21.
//

import Foundation

protocol UserRepositoryProtocol {
  func fetchUser(id: String, completion: @escaping (User?) -> Void)
  func fetchUsers(completion: @escaping ([User]?) -> Void)
}

final class UserRepository: UserRepositoryProtocol {
  private let apiService: UserApiServiceProtocol
  // private let storageService: UserStorageServiceProtocol e.g. Core Data, UserDefaults, and so on
  
  init(apiService: UserApiServiceProtocol = UserApiService()) {
    self.apiService = apiService
  }
  
  func fetchUser(id: String, completion: @escaping (User?) -> Void) {
    apiService.fetchUser(id: id, completion: completion)
  }
  
  func fetchUsers(completion: @escaping ([User]?) -> Void) {
    apiService.fetchUsers(completion: completion)
  }
}
