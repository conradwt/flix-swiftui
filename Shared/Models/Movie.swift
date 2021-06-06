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
  let genres: [Genre]?
  let posterUrl: String
  let rating: String
  let releasedOn: String?
  let title: String
  let totalGross: String
  
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

