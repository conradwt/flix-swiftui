//
//  UserDetailView.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct UserDetailView: View {
  let userId: String
  @ObservedObject var viewModel = UserDetailViewModel()
    
  var body: some View {
    VStack {
      ProfileImageView(imageName: viewModel.user?.avatarUrl ?? "AVATAR URL NOT SET", width: 100, height: 100)
        .padding()
      
      Form {
        Section(header: Text("Personal Info")) {
          HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
              Text("Name")
                .fontWeight(.semibold)
              Text("Email")
                .fontWeight(.semibold)
              Text("Member Since")
                .fontWeight(.semibold)
              Text("Username")
                .fontWeight(.semibold)
            }

            VStack(alignment: .leading, spacing: 20) {
              Text(viewModel.user?.name ?? "NAME NOT SET")
              Text(viewModel.user?.email ?? "EMAIL NOT SET")
              Text(viewModel.user?.memberSince ?? "MEMBER SINCE NOT SET")
              Text(viewModel.user?.username ?? "USERNAME NOT SET")
            }
          }
        }
      }
    }
    .navigationTitle(viewModel.user?.name ?? "NAME NOT SET")
    .navigationBarTitleDisplayMode(.inline)
  }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//      UserDetailView(user: UserDetailQuery.Data.User(id: "200",
//                                                     avatarUrl: "conradwt",
//                                                     email: "conradwt@gmail.com",
//                                                     memberSince: "April 2020",
//                                                     name: "Conrad Taylor",
//                                                     username: "conradwt"))
//    }
//}
