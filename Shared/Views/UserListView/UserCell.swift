//
//  FanCell.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct UserCell: View {
  var user: GetUsersQuery.Data.User
  
  var body: some View {
    NavigationLink(destination: UserDetailView(user: user)) {
      HStack {
        ProfileImageView(imageName: user.avatarUrl, width: 75, height: 75)
        
        VStack(alignment: .leading, spacing: 10) {
          Text(user.name)
                    
          Text(user.username)
        }
      }
    }
  }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
      UserCell(user: GetUsersQuery.Data.User(id: "200", avatarUrl: "conradwt", name: "Conrad Taylor", username: "conradwt", email: "conradwt@gmail.com"))
    }
}
