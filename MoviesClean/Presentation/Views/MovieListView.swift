//
//  MovieListView.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieListView: View {
    @StateObject var viewModel: MovieListViewModel

    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack(spacing: 16) {
                        ForEach(viewModel.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                VStack {
                                    WebImage(url: movie.posterURL)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 225)
                                        .cornerRadius(8)
                                        .shadow(radius: 4)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .navigationTitle("Popular Movies")
            .onAppear {
                viewModel.fetchMovies()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
            }
        }
    }
}

#Preview {
    let mockViewModel = MovieListViewModel(fetchMoviesUseCase: FetchMoviesUseCase(repository: MockRepository()))
    mockViewModel.movies = MockData.sampleMovies

    return MovieListView(viewModel: mockViewModel)
}
