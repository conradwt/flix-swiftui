//
//  MovieCell.swift
//  Flix
//
//  Created by Conrad Taylor on 5/29/21.
//

import SwiftUI

struct MovieCell: View {
  var movie: GetMoviesQuery.Data.Movie
  
  var body: some View {
    NavigationLink(destination: MovieDetailView(movie: movie)) {
      HStack {
        Image("placeholder")
          .resizable()
          .scaledToFit()
          .frame(height: 100)
  //        .cornerRadius(12)
        
        VStack(alignment: .leading, spacing: 10) {
          Text(movie.title)
            .font(.title2)
            .fontWeight(.semibold)
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            .multilineTextAlignment(.leading)
          
          Text(movie.rating)
            .font(.subheadline)
            .foregroundColor(.secondary)

          Text("\(Movie.numberToCurrency(movie.totalGross)!) Gross")
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
      }
    }
  }
}

struct MovieCell_Previews: PreviewProvider {
  static var previews: some View {
    MovieCell(movie:
                GetMoviesQuery.Data.Movie(id: "500",
                                          posterUrl: "spiderman",
                                          rating: "PG-13",
                                          title: "Spider-Man",
                                          totalGross: "123123123"))
  }
}
