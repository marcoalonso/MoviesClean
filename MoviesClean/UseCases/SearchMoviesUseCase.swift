//
//  SearchMoviesUseCase.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation

class SearchMoviesUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(query: String) async throws -> [Movie] {
        return try await repository.searchMovies(by: query)
    }
}
