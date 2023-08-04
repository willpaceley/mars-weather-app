//
//  MockDataProvider.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-08-04.
//

import Foundation

struct MockDataProvider: MarsWeatherDataProvider {
    func getMarsWeatherData() async throws -> MarsWeatherData {
        let marsWeatherData = Bundle.main.decode(MarsWeatherData.self, from: "MarsWeatherAPIData.json")
        return marsWeatherData
    }
}
