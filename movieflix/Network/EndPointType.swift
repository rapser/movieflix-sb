//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import Foundation

protocol EndPointType {
    var baseURL: String { get }
    var path: String { get }
    var url: URL? { get }
}
