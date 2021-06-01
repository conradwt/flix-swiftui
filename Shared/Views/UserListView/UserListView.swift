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
            UserCell(user: user)
          }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Fans")
        
      }
      
      //      if viewModel.isLoading { LoadingView() }
    }.onAppear { viewModel.getUsers() }
    
    //    .alert(item: $viewModel.alertItem) { alertItem in
    //      Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
    //    }
  }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
