//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import Foundation

extension URL {
    init?(image path: String) {
        let baseUrl = "https://image.tmdb.org/t/p/w300/"
        self.init(string: "\(baseUrl)\(path)")
    }
}
