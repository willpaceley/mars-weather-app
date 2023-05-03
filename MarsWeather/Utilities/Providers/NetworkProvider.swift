//
//  NetworkProvider.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import Foundation

final class NetworkProvider {
    static let shared = NetworkProvider()
    
    private init() {}
    
    func getMarsWeatherData() async throws -> MarsWeatherData {
        guard let url = createWeatherURL() else {
            throw MWError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let weatherData = try JSONDecoder().decode(MarsWeatherData.self, from: data)
            return weatherData
        } catch {
            throw MWError.invalidData
        }
    }
    
    private func createWeatherURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "mars.nasa.gov"
        components.path = "/rss/api/"
        components.queryItems = [
            URLQueryItem(name: "feed", value: "weather"),
            URLQueryItem(name: "category", value: "msl"),
            URLQueryItem(name: "feedtype", value: "json")
        ]
        
        return components.url
    }
}
