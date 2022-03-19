//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import Foundation

enum MovieAPI {
    case movies(page: Int)
    case movieDetail(movieId: Int)
    case video(movieId: Int)
    case top_rated
    case upcoming
    case popular
    case searchMovie
}

extension MovieAPI: EndPointType {
    
    static let apiKey = "60ea4d073f7eca298c191fcc89bc2c92"
    
    var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .movies:
            var str = ""
            if MovieViewModel.shared.isTodaysMovie {
                str = "/3/movie/now_playing?"
            } else {
                guard let id = MovieViewModel.shared.movies[MovieViewModel.shared.selectedMovieIndex].id else {return "0"}
                str = "/3/movie/\(id)/similar?"
            }
            return str
        case .movieDetail(let movieId):
            return "/3/movie/\(movieId)?"
        case .video(let movieId):
            return "/3/movie/\(movieId)/videos?"
        case .top_rated:
            return "3/movie/top_rated"
        case .popular:
            return "3/movie/popular"
        case .upcoming:
            return "3/movie/upcoming"
        case .searchMovie:
            return "3/search/movie?"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var queryItems = [
            URLQueryItem(name: "api_key", value: MovieAPI.apiKey),
            URLQueryItem(name: "language", value: "es")
        ]
        switch self {
        case .movies(let page):
            queryItems.append(URLQueryItem(name: "page", value: String(page)))
            return queryItems
        default:
            return queryItems
        }
    }
    
    var url: URL? {
        var urlComponents = URLComponents(string: baseURL + path)
        urlComponents?.queryItems?.append(contentsOf: queryItems)
        return urlComponents?.url
    }
}
