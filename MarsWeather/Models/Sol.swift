//
//  Sol.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import Foundation

struct Sol: Codable {
    let id, terrestrialDate, sol, ls: String
    let season: Season
    let minTemp, maxTemp, pressure: String
    let pressureString: Pressure
    let absHumidity, windSpeed, windDirection, atmoOpacity: String
    let sunrise, sunset: String
    let localUvIrradianceIndex: LocalUvIrradianceIndex
    let minGtsTemp, maxGtsTemp: String

    enum CodingKeys: String, CodingKey {
        case id
        case terrestrialDate = "terrestrial_date"
        case sol, ls, season
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case pressure
        case pressureString = "pressure_string"
        case absHumidity = "abs_humidity"
        case windSpeed = "wind_speed"
        case windDirection = "wind_direction"
        case atmoOpacity = "atmo_opacity"
        case sunrise, sunset
        case localUvIrradianceIndex = "local_uv_irradiance_index"
        case minGtsTemp = "min_gts_temp"
        case maxGtsTemp = "max_gts_temp"
    }
}

enum Pressure: String, Codable {
    case empty = "--"
    case higher = "Higher"
    case lower = "Lower"
}

enum LocalUvIrradianceIndex: String, Codable {
    case empty = "--"
    case high = "High"
    case low = "Low"
    case moderate = "Moderate"
    case veryHigh = "Very_High"
}

enum Season: String, Codable {
    case month1 = "Month 1"
    case month2 = "Month 2"
    case month3 = "Month 3"
    case month4 = "Month 4"
    case month5 = "Month 5"
    case month6 = "Month 6"
    case month7 = "Month 7"
    case month8 = "Month 8"
    case month9 = "Month 9"
    case month10 = "Month 10"
    case month11 = "Month 11"
    case month12 = "Month 12"
}
