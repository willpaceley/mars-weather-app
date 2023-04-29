//
//  MockData.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import Foundation

struct MockData {
    static let sol = Sol(id: "3617",
                         terrestrialDate: "2023-04-24",
                         sol: "3809",
                         ls: "55",
                         season: .month2,
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
    
    static let sols = [
        Sol(id: "3617",
            terrestrialDate: "2023-04-24",
            sol: "3809",
            ls: "55",
            season: .month2,
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
            maxGtsTemp: "-3"),
        
        Sol(id: "3613",
            terrestrialDate: "2023-04-23",
            sol: "3808",
            ls: "54",
            season: .month2,
            minTemp: "-80",
            maxTemp: "-25",
            pressure: "851",
            pressureString: "Higher",
            absHumidity: "--",
            windSpeed: "--",
            windDirection: "--",
            atmoOpacity: "Sunny",
            sunrise: "06:08",
            sunset: "17:54",
            localUvIrradianceIndex: .moderate,
            minGtsTemp: "-91",
            maxGtsTemp: "-8"),
    ]
}
