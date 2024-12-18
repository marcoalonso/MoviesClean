//
//  MovieListViewModel.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchResults: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let fetchMoviesUseCase: FetchMoviesUseCase
    private let searchMoviesUseCase: SearchMoviesUseCase

    init(fetchMoviesUseCase: FetchMoviesUseCase, searchMoviesUseCase: SearchMoviesUseCase) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
        self.searchMoviesUseCase = searchMoviesUseCase
    }

    func fetchMovies() {
        Task {
            isLoading = true
            do {
                self.movies = try await fetchMoviesUseCase.execute()
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }

    func searchMovies(query: String) {
        guard !query.isEmpty else {
            self.searchResults = []
            return
        }

        Task {
            isLoading = true
            do {
                self.searchResults = try await searchMoviesUseCase.execute(query: query)
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
