//
//  MWError.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import Foundation

enum MWError: Error {
    case defaultError
    case invalidURL
    case invalidResponse(Int)
    case decodingError(Error)
    case cacheError(Error)
    case genericError(Error)
}
