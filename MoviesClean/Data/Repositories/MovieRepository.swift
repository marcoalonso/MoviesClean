//
//  MovieRepository.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation

protocol MovieRepository {
    func fetchMovies() async throws -> [Movie]
    func searchMovies(by name: String) async throws -> [Movie]
}
