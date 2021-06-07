//
//  Movie.swift
//  Flix
//
//  Created by Conrad Taylor on 5/29/21.
//

import Foundation

struct Movie: Decodable {
  let id: String
  let description: String?
  let director: String?
  let duration: String?
  let posterUrl: String
  let rating: String
  let releasedOn: String?
  let title: String
  let totalGross: String
  let genres: [Genre]?
  
  init(movie: MovieListQuery.Data.Movie) {
    self.id = movie.id
    self.description = nil
    self.director = nil
    self.duration = nil
    self.posterUrl = movie.posterUrl
    self.rating = movie.rating
    self.releasedOn = nil
    self.title = movie.title
    self.totalGross = movie.totalGross
    self.genres = nil
  }
  
  init(movie: MovieDetailQuery.Data.Movie) {
    self.id = movie.id
    self.description = movie.description
    self.director = movie.director
    self.duration = movie.duration
    self.posterUrl = movie.posterUrl
    self.rating = movie.rating
    self.releasedOn = movie.releasedOn
    self.title = movie.title
    self.totalGross = movie.totalGross
    self.genres = movie.genres as? [Genre]
  }
}

struct MovieHelper {
  static func numberToCurrency(_ stringValue: String) -> String? {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    formatter.locale = NSLocale.current
    formatter.numberStyle = .currency
    
    return formatter.string(from: NSNumber(value: Int(stringValue) ?? 0))
  }
}

struct Genre: Decodable {
  let id: String
  let name: String
}

struct MoviesResponse: Decodable {
  let results: [Movie]
}

//struct MockData {
//  static let movies = [sampleMovie, sampleMovie, sampleMovie]
//  
//  static let sampleMovie = Movie(id: 0000002,
//                                 posterURL: "https://via.placeholder.com/150x221",
//                                 rating: "PG-13",
//                                 title: "Spider-Man",
//                                 totalGross: "825025036")
//}

