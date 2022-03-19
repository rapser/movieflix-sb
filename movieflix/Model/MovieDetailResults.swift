//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import Foundation

struct MovieDetailResults: Codable {
    let genres : [Genres]
}

struct Genres: Codable {
    let id: Int
    let name: String
}
