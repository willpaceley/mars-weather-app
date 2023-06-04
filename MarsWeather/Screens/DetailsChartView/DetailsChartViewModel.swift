//
//  DetailsChartViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-29.
//

import SwiftUI

@MainActor final class DetailsChartViewModel: ObservableObject {
    @Published var selectedTimeCoordinate: TimeCoordinate = .month
    
    let weatherDetail: WeatherDetail
    let reports: [Report]
    
    var selectedReports: [Report] {
        getReportSelection(for: selectedTimeCoordinate)
    }
    
    var icon: String {
        getIcon(for: self.weatherDetail)
    }
    
    var description: String {
        getDescription(for: self.weatherDetail)
    }
    
    init(weatherDetail: WeatherDetail, reports: [Report]) {
        self.weatherDetail = weatherDetail
        self.reports = reports
    }
    
    func getMonthNumber(of month: MarsMonth) -> Int {
        let numberString = String(month.rawValue.split(separator: " ")[1])
        let monthNumber = Int(numberString)!
        return monthNumber
    }
    
    private func getReportSelection(for timeCoordinate: TimeCoordinate) -> [Report] {
        switch timeCoordinate {
        case .month:
            return Array(reports[0..<31])
        case .sixMonth:
            return Array(reports[0..<180])
        case .year:
            return Array(reports[0..<365])
        case .twoYear:
            return Array(reports[0..<730])
        case .all:
            return reports
        }
    }
    
    private func getIcon(for weatherDetail: WeatherDetail) -> String {
        switch weatherDetail {
        case .temperature:
            return "thermometer.medium"
        case .daylight:
            return "sun.and.horizon.fill"
        case .conditions:
            return "cloud.sun.fill"
        case .pressure:
            return "gauge.medium"
        case .irradiance:
            return "sun.max.fill"
        }
    }
    
    private func getDescription(for weatherDetail: WeatherDetail) -> String {
        switch weatherDetail {
        case .temperature:
            return """
            Mars is farther from the Sun than Earth, it makes that Mars is colder than our planet. \
            Moreover, Martian's atmosphere, which is extremely tenuous, does not retain the heat; \
            hence the difference between day and night's temperatures is more pronounced than in our planet.
            """
            
        case .daylight:
            return """
            The duration of a Martian day (sol) is about 24 hours and 40 minutes. \
            The duration of daylight varies along the Martian year, as on Earth.
            """
            
        case .conditions:
            return """
            Weather on Mars is more extreme than Earth's. Mars is cooler and with \
            bigger differences between day and night temperatures. Moreover, \
            dust storms lash its surface. However, Mars' and Earth's climates have \
            important similarities, such as the polar ice caps or seasonal changes. \
            As on Earth, on Mars we can have sunny, cloudy or windy days, for example.
            """
            
        case .pressure:
            return """
            Pressure is a measure of the total mass in a column of air above us. Because \
            Martian's atmosphere is extremely tenuous, pressure on Mars' surface is about \
            160 times smaller than pressure on Earth. Average pressure on Martian surface \
            is about 700 Pascals (100000 Pascals on Earth) Curiosity is into Gale crater, \
            which is about 5 kilometers (3 miles) depth. For this reason, pressure measured \
            by REMS is usually higher than average pressure on the entire planet.
            """
            
        case .irradiance:
            return """
            Local ultraviolet (UV) irradiance index is an indicator of the intensity of the ultraviolet \
            radiation from the Sun at Curiosity's location. UV radiation is a damaging agent for life. \
            On Earth, the ozone layer prevents damaging ultraviolet light from reaching the surface, to \
            the benefit of both plants and animals. However, on Mars, due to the absence of ozone in the \
            atmosphere, ultraviolet radiation reaches the Martian surface.
            """
        }
    }
}

enum TimeCoordinate {
    case month
    case sixMonth
    case year
    case twoYear
    case all
}
