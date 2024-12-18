//
//  MovieDetailView.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                        .cornerRadius(12)
                        .shadow(radius: 8)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(maxWidth: 300, minHeight: 450)
                        .cornerRadius(12)
                }

                Text(movie.title ?? "")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()

                Text(movie.overview ?? "")
                    .font(.body)
                    .padding()
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: MockData.singleMovie)
}
