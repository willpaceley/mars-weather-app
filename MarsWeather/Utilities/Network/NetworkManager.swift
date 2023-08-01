//
//  NetworkProvider.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import Foundation

final class NetworkManager {
    typealias WeatherDataCache = Cache<String, MarsWeatherData>
    
    static let shared = NetworkManager()
    
    private var cache = WeatherDataCache()
    private let WEATHER_DATA_KEY = "MarsWeatherData"
    private let CACHE_NAME = "MarsWeatherDataCache"
        
    private init() {
        // Check if there's a cache persisted in file system
        if let weatherDataCache = loadCacheFromDisc(withName: CACHE_NAME) {
            cache = weatherDataCache
        }
    }
    
    // MARK: - Public Methods
    func getMarsWeatherData() async throws -> MarsWeatherData {
        // Check if there is already weather API data in the cache
        if let weatherData = cache.value(forKey: WEATHER_DATA_KEY) {
            print("Found unexpired cached data, skipping API call.")
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
            try cache.saveToDisc(withName: CACHE_NAME)
            return weatherData
        } catch {
            throw MWError.invalidData
        }
    }
    
    // MARK: - Private Methods
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
    
    private func loadCacheFromDisc(withName name: String, using fileManager: FileManager = .default) -> WeatherDataCache? {
        let folderURLs = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        let fileURL = folderURLs[0].appending(path: name + ".cache")
        
        guard let data = try? Data(contentsOf: fileURL) else {
            print("Could not obtain data from fileURL in loadCacheFromDisc(withName:using:)")
            return nil
        }
        
        if let cache = try? JSONDecoder().decode(WeatherDataCache.self, from: data) {
            print("Found a cache in disc! Loading...")
            return cache
        }
        
        return nil
    }
}
