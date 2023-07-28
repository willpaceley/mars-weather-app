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
    let soles: [Report]
}

#if DEBUG
struct MockData {
    static let report = Report(id: "3617",
                         terrestrialDate: "2023-04-24",
                         sol: "3809",
                         ls: "55",
                         month: .month2,
                         minTemp: "-79",
                         maxTemp: "-26",
                         pressure: "852",
                         pressureString: "Higher",
                         absHumidity: "--",
                         windSpeed: "--",
                         windDirection: "--",
                         atmoOpacity: "Sunny",
                         sunrise: "06:08",
                         sunset: "17:54",
                         localUvIrradianceIndex: .moderate,
                         minGtsTemp: "-92",
                         maxGtsTemp: "-3")
    
    static func getMockWeatherData() -> [Report] {
        let marsWeatherData = Bundle.main.decode(MarsWeatherData.self, from: "MarsWeatherAPIData.json")
        return marsWeatherData.soles
    }
}
#endif
