//
//  MockRepository.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation

class MockRepository: MovieRepository {
    func fetchMovies() async throws -> [Movie] {
        return MockData.sampleMovies
    }
}
