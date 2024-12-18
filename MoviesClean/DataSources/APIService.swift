//
//  APIService.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation

import Foundation

class APIService: MovieRepository {
    private let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=bbf4ee605b49ebabf960545fbfbb1e0a")!

    func fetchMovies() async throws -> [Movie] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MovieResponse.self, from: data)
        print("Debug: response \(response.results.count)")
        return response.results
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}
