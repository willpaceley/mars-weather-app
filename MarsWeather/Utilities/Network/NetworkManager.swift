//
//  NetworkProvider.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let cache = Cache<String, MarsWeatherData>()
    private let WEATHER_DATA_KEY = "MarsWeatherData"
        
    private init() {}
    
    func getMarsWeatherData() async throws -> MarsWeatherData {
        // Check if there is already weather API data in the cache
        if let weatherData = cache.value(forKey: WEATHER_DATA_KEY) {
            return weatherData
        }
        
        // If nothing in cache, fetch data from API
        guard let url = createWeatherURL() else {
            throw MWError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let weatherData = try JSONDecoder().decode(MarsWeatherData.self, from: data)
            cache.insert(weatherData, forKey: WEATHER_DATA_KEY)
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
