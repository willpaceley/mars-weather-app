//
//  MWError.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import Foundation

enum MWError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}