//
//  MWCache.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-08-04.
//

import Foundation

final class MWCache {
    typealias WeatherDataCache = Cache<String, MarsWeatherData>
    
    private let WEATHER_DATA_KEY = "MarsWeatherData"
    private let CACHE_NAME = "MarsWeatherDataCache"
    private var cache = WeatherDataCache()
    
    static let shared = MWCache()
    
    private init() {
        if let weatherDataCache = loadCacheFromDisc(withName: CACHE_NAME) {
            cache = weatherDataCache
        }
    }
    
    func getMarsWeatherData() -> MarsWeatherData? {
        cache.value(forKey: WEATHER_DATA_KEY)
    }
    
    func insert(_ weatherData: MarsWeatherData) throws {
        cache.insert(weatherData, forKey: WEATHER_DATA_KEY)
        do {
            try cache.saveToDisc(withName: CACHE_NAME)
        } catch {
            throw MWError.cacheError(error)
        }
    }
    
    private func loadCacheFromDisc(withName name: String, using fileManager: FileManager = .default) -> WeatherDataCache? {
        let folderURLs = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        let fileURL = folderURLs[0].appending(path: name + ".cache")
        
        guard let data = try? Data(contentsOf: fileURL) else {
            print("Could not obtain data from fileURL in loadCacheFromDisc(withName:using:)")
            return nil
        }
        
        if let cache = try? JSONDecoder().decode(Cache<String, MarsWeatherData>.self, from: data) {
            print("Found a cache in disc! Loading...")
            return cache
        }
        
        return nil
    }
}
