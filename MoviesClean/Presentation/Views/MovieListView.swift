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
                                
                                Text(movie.title ?? "Unknown")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 150)
                                    .lineLimit(2)
                                    .padding(.top, 8)
                            }
                        }
                    }
                }
                .padding(.horizontal)
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
