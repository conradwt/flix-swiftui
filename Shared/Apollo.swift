//
//  Apollo.swift
//  Flix
//
//  Created by Conrad Taylor on 5/29/21.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
  private init() {}
  
  lazy var apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
}
