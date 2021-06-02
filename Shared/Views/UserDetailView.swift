//
//  UserDetailView.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct UserDetailView: View {
  var user: GetUsersQuery.Data.User
  
  var body: some View {
    VStack {
      ProfileImageView(imageName: user.avatarUrl, width: 100, height: 100)
        .padding()
      
      Section(header: Text("Personal Info")) {
        Text(user.name)
        Text(user.username)
        Text(user.email)
      }
    }
    .navigationTitle(user.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
      UserDetailView(user: GetUsersQuery.Data.User(id: "200", avatarUrl: "conradwt", name: "Conrad Taylor", username: "conradwt", email: "conradwt@gmail.com"))
    }
}
