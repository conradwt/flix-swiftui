//
//  ContentView.swift
//  Shared
//
//  Created by Conrad Taylor on 5/19/21.
//

import SwiftUI

struct MovieListView: View {
  @StateObject private var viewModel = MovieListViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(viewModel.movies, id: \.id) { movie in
            MovieCell(movieId: movie.id)
//            Text("Movie List View")
          }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Movies")
  
      }

    }
    .onAppear {
      viewModel.onAppear()
    }

  }
}

struct MovieListView_Previews: PreviewProvider {
  static var previews: some View {
    MovieListView()
  }
}
