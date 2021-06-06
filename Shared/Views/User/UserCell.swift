//
//  FanCell.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct UserCell: View {
  var userId: String
  @ObservedObject var viewModel = UserDetailViewModel()
  
  var body: some View {
    NavigationLink(destination: UserDetailView(userId: userId)) {
      HStack {
        ProfileImageView(imageName: viewModel.user?.avatarUrl ?? "AVATAR URL NOT SET", width: 75, height: 75)
        
        VStack(alignment: .leading, spacing: 10) {
          Text(viewModel.user?.name ?? "NAME NOT SET")
                    
          Text(viewModel.user?.memberSince ?? "MEMBER SINCE NOT SET")
        }
      }
    }
  }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//      UserCell(user: UserDetailQuery.Data.User(id: "200",
//                                               avatarUrl: "conradwt",
//                                               email: "conradwt@gmail.com",
//                                               memberSince: "April 2020",
//                                               name: "Conrad Taylor",
//                                               username: "conradwt"))
//    }
//}
