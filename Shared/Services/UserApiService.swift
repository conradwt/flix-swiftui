//
//  UserApiService.swift
//  Flix
//
//  Created by Conrad Taylor on 6/5/21.
//

import Foundation

protocol UserApiServiceProtocol {
  func fetchUser(id: String, completion: @escaping (User?) -> Void)
  func fetchUsers(completion: @escaping ([User]?) -> Void)
}

final class UserApiService: UserApiServiceProtocol {
  func fetchUser(id: String, completion: @escaping (User?) -> Void) {
    Network.shared.apollo.fetch(query: UserDetailQuery(id: id), cachePolicy: .fetchIgnoringCacheCompletely) { result in
      
      switch result {
      
      case .failure(let error):
        print(error.localizedDescription)
        completion(nil)
        
      case .success(let data):
        let model = data.data?.user?.decodeModel(type: User.self)
        completion(model)
      }
      
    }
  }
  
  func fetchUsers(completion: @escaping ([User]?) -> Void) {
    Network.shared.apollo.fetch(query: UserListQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
      
      switch result {
      
      case .failure(let error):
        print(error.localizedDescription)
        completion(nil)
        
      case .success(let data):
        let model = data.data?.users?.decodeModel(type: UsersResponse.self)
        completion(model?.results)
      }
      
    }
  }
}
