//
//  MockData.swift
//  MoviesClean
//
//  Created by Marco Alonso Rodriguez on 17/12/24.
//

import Foundation

struct MockData {
    static let sampleMovies: [Movie] = [
        Movie(
            backdrop_path: "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
            id: 1,
            original_title: "The Matrix",
            overview: "A computer hacker learns about the true nature of reality.",
            original_language: "en",
            title: "The Matrix",
            release_date: "1999-03-31",
            poster_path: "/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
        ),
        Movie(
            backdrop_path: "/s3TBrRGB1iav7gFOCNx3H31MoES.jpg",
            id: 2,
            original_title: "Inception",
            overview: "A thief with the ability to enter people's dreams takes on one last job.",
            original_language: "en",
            title: "Inception",
            release_date: "2010-07-16",
            poster_path: "/8s4h9friP6Ci3adRGahHARVd76E.jpg"
        ),
        Movie(
            backdrop_path: "/w2PMyoyLU22YvrGK3smVM9fW1jj.jpg",
            id: 3,
            original_title: "Interstellar",
            overview: "A team of explorers travels through a wormhole in space to save humanity.",
            original_language: "en",
            title: "Interstellar",
            release_date: "2014-11-07",
            poster_path: "/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg"
        ),
        Movie(
            backdrop_path: "/qhPtAc1TKbMPqNvcdXSOn9Bn7hZ.jpg",
            id: 4,
            original_title: "The Dark Knight",
            overview: "Batman faces the Joker, a criminal mastermind who terrorizes Gotham City.",
            original_language: "en",
            title: "The Dark Knight",
            release_date: "2008-07-18",
            poster_path: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
        )
    ]

    static let singleMovie: Movie = Movie(
        backdrop_path: "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
        id: 1,
        original_title: "The Matrix",
        overview: "A computer hacker learns about the true nature of reality.",
        original_language: "en",
        title: "The Matrix",
        release_date: "1999-03-31",
        poster_path: "/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
    )
}
