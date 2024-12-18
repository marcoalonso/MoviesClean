//
//  MoviesCleanApp.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import SwiftUI

@main
struct MoviesCleanApp: App {
    var body: some Scene {
        
        let apiService = APIService()
        let fetchMoviesUseCase = FetchMoviesUseCase(repository: apiService)
        let searchMoviesUseCase = SearchMoviesUseCase(repository: apiService)
        let viewModel = MovieListViewModel(fetchMoviesUseCase: fetchMoviesUseCase, searchMoviesUseCase: searchMoviesUseCase)
        
        WindowGroup {
            TabBarView(viewModel: viewModel)
        }
    }
}
