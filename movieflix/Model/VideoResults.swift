//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import Foundation

struct VideoResults: Codable {
    let results: [VideoKey]
}

struct VideoKey: Codable {
    let key: String
    let id: String
}
