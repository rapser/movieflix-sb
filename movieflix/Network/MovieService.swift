//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import Foundation

class MovieService: Networkable {
    
    static func loadMovies(_ page: Int, completion: @escaping ([Movie]) -> Void) {
        requestAPI(MovieAPI.movies(page: page)) { data in
            let decodedData = self.decode(MovieResults.self, data: data)
            completion(decodedData?.movies ?? [])
        }
    }
    
    static func loadMovieDetail(_ movieId: Int, completion: @escaping ([Genres]) -> Void) {
        requestAPI(MovieAPI.movieDetail(movieId: movieId)) { (data) in
            let decodedData = self.decode(MovieDetailResults.self, data: data)
            completion(decodedData?.genres ?? [])
        }
    }
    
    static func loadVideo(_ movieId: Int, completion: @escaping ([VideoKey]) -> Void) {
        requestAPI(MovieAPI.video(movieId: movieId)) { (data) in
            let decodedData = self.decode(VideoResults.self, data: data)
            completion(decodedData?.results ?? [])
        }
    }
    
    static func loadMoviesTopRated(completion: @escaping ([Movie]) -> Void) {
        requestAPI(MovieAPI.top_rated) { data in
            let decodedData = self.decode(MovieResults.self, data: data)
            completion(decodedData?.movies ?? [])
        }
    }
    
    static func loadMoviesUpcoming(completion: @escaping ([Movie]) -> Void) {
        requestAPI(MovieAPI.upcoming) { data in
            let decodedData = self.decode(MovieResults.self, data: data)
            completion(decodedData?.movies ?? [])
        }
    }
    
    static func loadMoviesPopular(completion: @escaping ([Movie]) -> Void) {
        requestAPI(MovieAPI.popular) { data in
            let decodedData = self.decode(MovieResults.self, data: data)
            completion(decodedData?.movies ?? [])
        }
    }
    
    static func searchMovies(completion: @escaping ([Movie]) -> Void) {
        requestAPI(MovieAPI.searchMovie) { data in
            let decodedData = self.decode(MovieResults.self, data: data)
            completion(decodedData?.movies ?? [])
        }
    }
    
}
