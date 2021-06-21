//
//  ContentView.swift
//  Shared
//
//  Created by Conrad Taylor on 5/19/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct MovieListView: View {
  @StateObject private var viewModel = MovieListViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(viewModel.movies, id: \.id) { movie in
            MovieCell(movie: movie)
          }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Movies")
  
      }

//      if viewModel.isLoading { LoadingView() }
    }
    .onAppear { viewModel.getMovies() }
    
    
//    .alert(item: $viewModel.alertItem) { alertItem in
//      Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
//    }
  }
}

@available(iOS 15.0, *)
struct MovieListView_Previews: PreviewProvider {
  static var previews: some View {
    MovieListView()
  }
}
