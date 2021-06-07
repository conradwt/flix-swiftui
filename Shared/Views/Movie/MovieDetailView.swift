//
//  MovieDetailView.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct MovieDetailView: View {
  let movieId: String
  @ObservedObject var viewModel = MovieDetailViewModel()
  
  var body: some View {
    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
      Spacer()
      
      Image("placeholder")
        .resizable()
        .scaledToFit()
        .frame(width: 250)
//        .cornerRadius(12)
      
      Text(viewModel.movie?.title ?? "TITLE NOT SET")
        .font(.title2)
        .fontWeight(.semibold)
        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        .multilineTextAlignment(.center)
      
      Text(viewModel.movie?.rating ?? "RATING NOT SET")
      
      Text(MovieHelper.numberToCurrency(viewModel.movie?.totalGross ?? "0")!)
      
      Spacer()
    }
    .navigationTitle(viewModel.movie?.title ?? "TITLE NOT SET")
    .navigationBarTitleDisplayMode(.inline)
    
  }
}

//struct MovieDetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    MovieDetailView(movie: MovieDetailQuery.Data.Movie(id: "500",
//                                                      description: "When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family. ",
//                                                      director: "Sam Raimi",
//                                                      duration: "121 min",
//                                                      posterUrl: "spiderman",
//                                                      rating: "PG-13",
//                                                      releasedOn: "2002",
//                                                      title: "Spider-Man",
//                                                      totalGross: "123123123"))
//
//  }
//}
