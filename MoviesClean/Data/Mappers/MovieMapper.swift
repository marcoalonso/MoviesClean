//
//  MovieMapper.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation
import SwiftData

struct MovieMapper {
    static func mapToFavoriteMovie(from movie: Movie) -> FavoriteMovie {
        return FavoriteMovie(
            id: movie.id ?? 0,
            title: movie.title ?? "Unknown Title",
            overview: movie.overview,
            releaseDate: movie.release_date,
            posterURL: movie.poster_path,
            voteAverage: movie.vote_average,
            backdropURL: movie.backdrop_path
        )
    }

    static func mapToMovie(from favorite: FavoriteMovie) -> Movie {
        return Movie(
            backdrop_path: favorite.backdropURL,
            id: favorite.id,
            original_title: nil,
            overview: favorite.overview,
            original_language: nil,
            title: favorite.title,
            release_date: favorite.releaseDate,
            poster_path: favorite.posterURL,
            vote_average: favorite.voteAverage
        )
    }
}
