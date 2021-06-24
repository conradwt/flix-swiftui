//
//  MovieDetailView.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct MovieDetailView: View {
  var movie: MovieListQuery.Data.Movie
  
  var body: some View {
    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
      Spacer()
      
      MovieImageView(imageUrl: movie.posterUrl, width: 250, height: 298)
            
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

//struct MovieDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    MovieDetailView(movie: MovieDetailQuery.Data.Movie(id: "500",
//                                                       description: "When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family.",
//                                                       director: "Sam Raimi",
//                                                       duration: "121 min",
//                                                       posterUrl: "spiderman",
//                                                       rating: "PG-13",
//                                                       releasedOn: "2016",
//                                                       title: "Spider-Man",
//                                                       totalGross: "123123123"))
//  }
//}
