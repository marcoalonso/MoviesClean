//
//  APIService.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
// bbf4ee605b49ebabf960545fbfbb1e0a

import Foundation

class APIService: MovieRepository {
    private let apiKey = "bbf4ee605b49ebabf960545fbfbb1e0a"
    private let baseURL = "https://api.themoviedb.org/3"

    func fetchMovies() async throws -> [Movie] {
        guard let url = URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Response.self, from: data)
        return response.results
    }

    func searchMovies(by name: String) async throws -> [Movie] {
        guard let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)/search/movie?api_key=\(apiKey)&language=es-MX&page=1&include_adult=false&query=\(encodedName)") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Response.self, from: data)
        return response.results
    }
}

struct Response: Decodable {
    let results: [Movie]
}
