//
//  Movie.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation

struct Movie: Identifiable, Decodable {
    let backdrop_path: String?
    let id: Int?
    let original_title: String?
    let overview: String?
    let original_language: String?
    let title: String?
    let release_date: String?
    let poster_path: String?

    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/original\(poster_path ?? "")")
    }
}
