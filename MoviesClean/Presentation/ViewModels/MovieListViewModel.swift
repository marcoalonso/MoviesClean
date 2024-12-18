//
//  MovieListViewModel.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let fetchMoviesUseCase: FetchMoviesUseCase
    
    init(fetchMoviesUseCase: FetchMoviesUseCase) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
    }
    
    func fetchMovies() {
        Task {
            isLoading = true
            do {
                movies = try await fetchMoviesUseCase.execute()
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
