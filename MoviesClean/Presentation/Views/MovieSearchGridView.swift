//
//  MovieSearchGridView.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieSearchGridView: View {
    @ObservedObject var viewModel: MovieListViewModel
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Searching...")
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(viewModel.searchResults) { movie in
                                NavigationLink(destination: MovieDetailView(movie: movie)) {
                                    VStack {
                                        WebImage(url: movie.posterURL)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 200)
                                            .cornerRadius(8)

                                        Text(movie.title ?? "Unknown")
                                            .font(.subheadline)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Search Movies")
            .searchable(text: $searchText)
            .onChange(of: searchText) { _, query in
                viewModel.searchMovies(query: query)
            }
        }
    }
}

#Preview {
    let mockRepository = MockRepository()
    let fetchMoviesUseCase = FetchMoviesUseCase(repository: mockRepository)
    let searchMoviesUseCase = SearchMoviesUseCase(repository: mockRepository)

    let mockViewModel = MovieListViewModel(fetchMoviesUseCase: fetchMoviesUseCase, searchMoviesUseCase: searchMoviesUseCase)
    mockViewModel.searchResults = MockData.sampleMovies

    return MovieSearchGridView(viewModel: mockViewModel)
}
