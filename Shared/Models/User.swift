//
//  User.swift
//  Flix
//
//  Created by Conrad Taylor on 6/5/21.
//

import Foundation

struct User: Decodable {
  var id: String
  var avatarUrl: String
  var email: String?
  var memberSince: String
  var name: String
  var username: String?
}

struct UsersResponse: Decodable {
  let results: [User]
}
