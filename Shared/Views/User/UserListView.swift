//
//  FanListView.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct UserListView: View {
  @StateObject private var viewModel = UserListViewModel()

  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(viewModel.users, id: \.id) { user in
            UserCell(userId: user.id)
//            Text("User List View")
          }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Fans")
        
      }
      
    }
    .onAppear {
      viewModel.onAppear()
    }
    
  }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
