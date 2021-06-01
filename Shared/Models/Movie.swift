//
//  Movie.swift
//  Flix
//
//  Created by Conrad Taylor on 5/29/21.
//

import Foundation

struct Movie: Identifiable, Decodable {
  let id: Int
  let posterURL: String
  let rating: String
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

struct MovieResponse: Decodable {
  let request: [Movie]
}

struct MockData {
  static let movies = [sampleMovie, sampleMovie, sampleMovie]
  
  static let sampleMovie = Movie(id: 0000002,
                                 posterURL: "https://via.placeholder.com/150x221",
                                 rating: "PG-13",
                                 title: "Spider-Man",
                                 totalGross: "825025036")
}

