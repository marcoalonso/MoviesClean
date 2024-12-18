//
//  FavoriteMovie.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation
import SwiftData

@Model
class FavoriteMovie {
    @Attribute(.unique) var id: Int
    var title: String
    var overview: String?
    var releaseDate: String?
    var posterURL: String?
    var voteAverage: Double?
    var backdropURL: String?

    init(id: Int, title: String, overview: String?, releaseDate: String?, posterURL: String?, voteAverage: Double?, backdropURL: String?) {
        self.id = id
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterURL = posterURL
        self.voteAverage = voteAverage
        self.backdropURL = backdropURL
    }
}
