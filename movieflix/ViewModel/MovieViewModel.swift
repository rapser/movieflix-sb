//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import Foundation

class MovieViewModel {
    
    static let shared = MovieViewModel()
    
    var isTodaysMovie: Bool = true
    var movies: [Movie]
    var similarMovies: [Movie]
    var video : [VideoKey]
    var selectedMovieIndex: Int = 0
    var genres: [Genres]
    
    init() {
        self.movies = [Movie]()
        self.genres = [Genres]()
        self.video = [VideoKey]()
        self.similarMovies = [Movie]()
    }
    
    func fetchMovies(completionHandler: @escaping () -> Void) {
        self.isTodaysMovie = true
        APIManager.loadMovies(1) { (movies) in
            DispatchQueue.main.async {
                self.movies = movies
                completionHandler()
            }
        }
    }
    
    func fetchMovieDetail(completionHandler: @escaping () -> Void) {
        
        APIManager.loadMovieDetail(movies[selectedMovieIndex].id!) { genre in
            DispatchQueue.main.async {
                self.genres = genre
                completionHandler()
            }
        }
    }
    
    func fetchVideo(completionHandler: @escaping () -> Void) {
        APIManager.loadVideo(movies[selectedMovieIndex].id!) {
            video in
            DispatchQueue.main.async {
                self.video = video
                completionHandler()
            }
        }
    }
    
    func fetchSimilarMovies(completionHandler: @escaping ()  -> Void ) {
        self.isTodaysMovie = false
        APIManager.loadMovies(1) { similarMovies in
            self.similarMovies = similarMovies
        }
    }
    
    func updateMovieIndex(_ index: Int) -> Void {
        self.selectedMovieIndex = index
    }
    
    func fetchMovieIndex() -> Int {
        return self.selectedMovieIndex
    }
    
    func fetchMoviesTopRated(completionHandler: @escaping () -> Void) {
        self.isTodaysMovie = true
        APIManager.loadMoviesTopRated(completion: { (movies) in
            DispatchQueue.main.async {
                self.movies = movies
                completionHandler()
            }
        })
    }
    
    func fetchMoviesPopular(completionHandler: @escaping () -> Void) {
        self.isTodaysMovie = true
        APIManager.loadMoviesPopular(completion: { (movies) in
            DispatchQueue.main.async {
                self.movies = movies
                completionHandler()
            }
        })
    }
    
    func fetchMoviesUpcoming(completionHandler: @escaping () -> Void) {
        self.isTodaysMovie = true
        APIManager.loadMoviesUpcoming(completion: { (movies) in
            DispatchQueue.main.async {
                self.movies = movies
                completionHandler()
            }
        })
    }
}


