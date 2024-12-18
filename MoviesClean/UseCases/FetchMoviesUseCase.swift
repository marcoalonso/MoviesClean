//
//  FetchMoviesUseCase.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation

import Foundation

class FetchMoviesUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Movie] {
        return try await repository.fetchMovies()
    }
}
