//
//  MarsWeatherData.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//
// Mars Weather Data API: https://mars.nasa.gov/rss/api/?feed=weather&category=msl&feedtype=json

import Foundation

struct MarsWeatherData: Codable {
    let descriptions: Descriptions
    let soles: [Sol]
}
