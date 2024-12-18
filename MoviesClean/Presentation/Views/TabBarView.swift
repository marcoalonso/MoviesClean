//
//  TabBarView.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var viewModel: MovieListViewModel

    var body: some View {
        TabView {
            MovieListView(viewModel: viewModel)
                .tabItem {
                    Label("Movies", systemImage: "film")
                }

            MovieSearchGridView(viewModel: viewModel)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    let apiService = APIService()
    let fetchMoviesUseCase = FetchMoviesUseCase(repository: apiService)
    let searchMoviesUseCase = SearchMoviesUseCase(repository: apiService)
    let viewModel = MovieListViewModel(fetchMoviesUseCase: fetchMoviesUseCase, searchMoviesUseCase: searchMoviesUseCase)
    
    TabBarView(viewModel: viewModel)
}
