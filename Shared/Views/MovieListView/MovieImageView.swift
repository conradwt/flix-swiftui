//
//  MovieImageView.swift
//  Flix
//
//  Created by Conrad Taylor on 6/20/21.
//

import SwiftUI

struct MovieImageView: View {
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
      .frame(width: width, height: height)
    }
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
      MovieImageView(imageUrl: "http://localhost:4000/uploads/movie/posters/131/spiderman-thumb.png",
                     width: 100,
                     height: 148)
    }
}
