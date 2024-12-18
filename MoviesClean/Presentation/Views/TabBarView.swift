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
        }
    }
}
