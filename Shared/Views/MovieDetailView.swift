//
//  MovieDetailView.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct MovieDetailView: View {
  var movie: GetMoviesQuery.Data.Movie
  
  var body: some View {
    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
      Spacer()
      
      Image("placeholder")
        .resizable()
        .scaledToFit()
        .frame(width: 250)
//        .cornerRadius(12)
      
      Text(movie.title)
        .font(.title2)
        .fontWeight(.semibold)
        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        .multilineTextAlignment(.center)
      
      Text(movie.rating)
      
      Text(Movie.numberToCurrency(movie.totalGross)!)
      
      Spacer()
    }
    .navigationTitle(movie.title)
    .navigationBarTitleDisplayMode(.inline)
    
  }
}

struct MovieDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetailView(movie: GetMoviesQuery.Data.Movie(id: "500", posterUrl: "spiderman", rating: "PG-13", title: "Spider-Man", totalGross: "50"))
  }
}
