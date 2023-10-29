//
//  Movie.swift
//  TableViewApp
//
//  Created by Simonas Kytra on 29/10/2023.
//

import Foundation

struct Movie {
    
    let title: String
    let image: String
    let genre: String
    let year: Int
    let description: String
    let trailerUrl: String
    
    static func createMovie() -> [Movie] {
        var movies: [Movie] = []
        
        let titles = DataManager.shared.movieTitles
        let images = DataManager.shared.imageNames
        let genres = DataManager.shared.movieGenres
        let years = DataManager.shared.releaseYears
        let descriptions = DataManager.shared.descriptions
        let trailerUrls = DataManager.shared.movieTrailerUrls
        
        for i in 0..<titles.count {
            let movie = Movie(title: titles[i], image: images[i], genre: genres[i], year: years[i], description: descriptions[i], trailerUrl: trailerUrls[i])
            movies.append(movie)
        }
        
        return movies
    }
    
}
