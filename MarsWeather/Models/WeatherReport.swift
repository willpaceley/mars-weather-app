//
//  WeatherReport.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import Foundation

struct WeatherReport: Codable, Identifiable, Equatable {
    let id: String
    let terrestrialDate : String
    let sol: String
    let ls: String
    let month: MarsMonth
    let minTemp, maxTemp: String
    let pressure, pressureString: String
    let absHumidity: String
    let windSpeed, windDirection: String
    let atmoOpacity: String
    let sunrise, sunset: String
    let localUvIrradianceIndex: UVIrradianceIndex
    let minGtsTemp, maxGtsTemp: String

    enum CodingKeys: String, CodingKey {
        case id
        case terrestrialDate = "terrestrial_date"
        case sol, ls
        case month = "season"
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

enum UVIrradianceIndex: String, Codable {
    case empty = "--"
    case low = "Low"
    case moderate = "Moderate"
    case high = "High"
    case veryHigh = "Very_High"
    
    func formatUVIndexString() -> String {
        let formattedResult: String
        switch self {
        case .empty:
            formattedResult = "No Data"
        case .veryHigh:
            formattedResult = "Very High"
        default:
            formattedResult = self.rawValue
        }
        return formattedResult
    }
}

enum MarsMonth: String, Codable, CaseIterable, Identifiable {
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
    var id: Self { self }
}
