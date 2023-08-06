//
//  MarsWeatherDataProvider.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-08-04.
//

import Foundation

protocol MarsWeatherDataProvider {
    func getMarsWeatherData() async throws -> MarsWeatherData
}
