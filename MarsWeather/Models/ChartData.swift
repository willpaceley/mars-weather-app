//
//  ChartData.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-29.
//

import Foundation
import Charts

// MARK: Temperature
struct MarsTemperature: Identifiable {
    let id = UUID()
    let type: TemperatureType
    let temperature: Int
    let date: Date
}

enum TemperatureType: String {
    case maxAirTemp = "Max Air"
    case minAirTemp = "Min Air"
    case maxGroundTemp = "Max Ground"
    case minGroundTemp = "Min Ground"
}

// MARK: Daylight
struct MarsSunlight: Identifiable {
    let id = UUID()
    let type: SunlightType
    let date: Date
    let time: Date
}

enum SunlightType: String {
    case sunrise = "Sunrise"
    case sunset = "Sunset"
}

// MARK: Conditions
struct Condition: Identifiable {
    let id = UUID()
    let description: String
    var numberOfDays: Int = 0
}

// MARK: Pressure
struct PressureData: Identifiable {
    let id = UUID()
    let date: Date
    let pressure: Int
}

// MARK: Irradiance
struct MarsIrradianceData: Identifiable {
    let id = UUID()
    let date: Date
    let irradiance: String
}
