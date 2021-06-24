//
//  ProfileImageView.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct ProfileImageView: View {
  var imageUrl: String
  var width: CGFloat
  var height: CGFloat
  
  var body: some View {
    AsyncImage(url: URL(string: imageUrl),
               transaction: Transaction(animation: .spring())) { phase in
      switch phase {
      case .empty:
        Color.purple.opacity(0.1)
      case .success(let image):
        image
          .resizable()
          .scaledToFit()
      case .failure(_):
        Image("placeholder")
          .resizable()
          .scaledToFit()
      @unknown default:
        Image(systemName: "exclamationmark.icloud")
      }
    }
    .frame(width: width, height: height, alignment: .center)
    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
  }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(imageUrl: "https://www.gravatar.com/avatar/da6b3c868c62469a4ede0a3cd9d0275a?s=100&d=robohash",
                         width: 100,
                         height: 100)
    }
}
