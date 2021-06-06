//
//  MovieCell.swift
//  Flix
//
//  Created by Conrad Taylor on 5/29/21.
//

import SwiftUI

struct MovieCell: View {
  let movieId: String
  @ObservedObject var viewModel = MovieDetailViewModel()
  
  var body: some View {
    NavigationLink(destination: MovieDetailView(movieId: movieId)) {
      HStack {
        Image("placeholder")
          .resizable()
          .scaledToFit()
          .frame(height: 100)
  //        .cornerRadius(12)
        
        VStack(alignment: .leading, spacing: 10) {
          Text(viewModel.movie?.title ?? "TITLE NOT SET")
            .font(.title2)
            .fontWeight(.semibold)
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            .multilineTextAlignment(.leading)
          
          Text(viewModel.movie?.rating ?? "RATING NOT SET")
            .font(.subheadline)
            .foregroundColor(.secondary)

          Text("\(Movie.numberToCurrency(viewModel.movie?.totalGross ?? "0")!) Gross")
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
      }
    }
  }
}

//struct MovieCell_Previews: PreviewProvider {
//  static var previews: some View {
//    MovieCell(movie: MovieDetailQuery.Data.Movie(id: "500",
//                                                 description: "",
//                                                 director: "Sam Raimi",
//                                                 duration: "121 min",
//                                                 posterUrl: "spiderman",
//                                                 rating: "PG-13",
//                                                 releasedOn: "2002",
//                                                 title: "Spider-Man",
//                                                 totalGross: "123123123"))
//  }
//}
