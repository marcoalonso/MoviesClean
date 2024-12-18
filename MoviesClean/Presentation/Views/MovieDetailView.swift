//
//  MovieDetailView.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                WebImage(url: movie.posterURL)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(movie.title ?? "")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()

                Text(movie.overview ?? "")
                    .font(.body)
                    .padding()
                
                HStack {
                    Text(movie.release_date ?? "")
                        .font(.footnote)
                    
                    Text( "⭐️ \(String(format: "%.2f", movie.vote_average ?? 0.0))")
                        .font(.footnote)
                }
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: MockData.singleMovie)
}
