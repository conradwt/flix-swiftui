//
//  User.swift
//  Flix
//
//  Created by Conrad Taylor on 6/5/21.
//

import Foundation

struct User: Decodable {
  let id: String
  let avatarUrl: String
  let email: String?
  let memberSince: String
  let name: String
  let username: String?
  
  init(user: UserListQuery.Data.User) {
    self.id = user.id
    self.avatarUrl = user.avatarUrl
    self.email = nil
    self.memberSince = user.memberSince
    self.name = user.name
    self.username = nil
  }
  
  init(user: UserDetailQuery.Data.User) {
    self.id = user.id
    self.avatarUrl = user.avatarUrl
    self.email = user.email
    self.memberSince = user.memberSince
    self.name = user.name
    self.username = user.username
  }
}

struct UsersResponse: Decodable {
  let results: [User]
}
