//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import Foundation

struct MovieResults: Codable {
    let page: Int?
    let movies: [Movie]?
    let numPages, numResults: Int?
    
    private enum CodingKeys: String, CodingKey {
        case page,
             numResults = "total_results",
             numPages = "total_pages",
             movies = "results"
    }
}
