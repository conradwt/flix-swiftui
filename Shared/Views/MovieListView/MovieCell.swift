//
//  MovieCell.swift
//  Flix
//
//  Created by Conrad Taylor on 5/29/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct MovieCell: View {
  @StateObject private var viewModel = MovieDetailViewModel()
  var movie: MovieListQuery.Data.Movie
  
  var body: some View {
    NavigationLink(destination: MovieDetailView(movie: movie)) {
      HStack {
        AsyncImage(url: URL(string: movie.posterUrl),
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
        .frame(width: 100, height: 148)

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

//struct MovieCell_Previews: PreviewProvider {
//  static var previews: some View {
//    MovieCell(movie: MovieDetailQuery.Data.Movie(id: "500",
//                                                 description: "When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family.",
//                                                 director: "Sam Raimi",
//                                                 duration: "121 min",
//                                                 posterUrl: "spiderman",
//                                                 rating: "PG-13",
//                                                 releasedOn: "2016",
//                                                 title: "Spider-Man",
//                                                 totalGross: "123123123"))
//  }
//}
