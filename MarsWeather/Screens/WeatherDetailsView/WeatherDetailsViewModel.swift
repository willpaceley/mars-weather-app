//
//  WeatherDetailsViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-29.
//

import SwiftUI
import Charts

@MainActor final class WeatherDetailsViewModel: ObservableObject {
    @Published var selectedTimeRange: TimeRange = .threeMonth
    @Published var isShowingAirTemp = true
    @Published var isShowingGroundTemp = false
    @Published var isShowingSunrise = true
    @Published var isShowingSunset = false
    
    let chartType: WeatherDetail
    let reports: [Report]
    
    var selectedReports: [Report] {
        getReportSelection(for: selectedTimeRange)
    }
    
    var icon: String {
        getIcon(for: chartType)
    }
    
    var description: String {
        getDescription(for: chartType)
    }
    
    var chartSummaryTitle: String {
        getSummaryTitle(for: chartType)
    }
    
    var chartSummary: String {
        getSummary(for: chartType, from: selectedReports)
    }
    
    // MARK: Initializer
    init(weatherDetail: WeatherDetail, reports: [Report]) {
        self.chartType = weatherDetail
        self.reports = reports
    }
    
    func getSummary(for chartType: WeatherDetail, from reports: [Report]) -> String {
        switch chartType {
        case .temperature:
            return getAverageTemperatureLabel(from: selectedReports)
            
        case .daylight:
            return getAverageDaylightLabel(from: selectedReports)
            
        case .conditions:
            return getConditionLabel(from: selectedReports)
            
        case .pressure:
            return getAveragePressureLabel(from: selectedReports)
            
        case .irradiance:
            return "Irradiance Summary"
        }
    }
    
    // MARK: - Private Methods
    private func getReportSelection(for timeRange: TimeRange) -> [Report] {
        switch timeRange {
        case .threeMonth:
            return Array(reports[0..<90])
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
    
    private func getSummaryTitle(for chartType: WeatherDetail) -> String {
        switch chartType {
        case .temperature:
            return "Average Temperature"
        case .daylight:
            return "Average Daylight Duration"
        case .conditions:
            return "Percentage of Sunny Days"
        case .pressure:
            return "Average Pressure"
        case .irradiance:
            return "Most Frequent UV Index"
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
    
    // MARK: Temperature Summary
    private func getAverageTemperatureLabel(from reports: [Report]) -> String {
        String(format: "%.1f", calculateAverageTemperature(from: reports)) + " °C"
    }
    
    private func calculateAverageTemperature(from reports: [Report]) -> Double {
        var sumTemperature = 0
        
        for report in reports {
            if isShowingAirTemp {
                if let minTemp = Int(report.minTemp), let maxTemp = Int(report.maxTemp) {
                    sumTemperature += (minTemp + maxTemp)
                }
            }
            if isShowingGroundTemp {
                if let minTemp = Int(report.minGtsTemp), let maxTemp = Int(report.maxGtsTemp) {
                    sumTemperature += (minTemp + maxTemp)
                }
            }
        }
        
        // Determine count of items in temperature sum
        var temperatureCount = reports.count
        if isShowingAirTemp { temperatureCount *= 2 }
        if isShowingGroundTemp { temperatureCount *= 2 }
        
        return Double(sumTemperature) / Double(temperatureCount)
    }
    
    // MARK: Daylight Summary
    private func getAverageDaylightLabel(from reports: [Report]) -> String {
        var totalMinutesOfSunlight = 0
        
        reports.forEach {
            let sunriseTime = $0.sunrise.getDaylightTime()!
            let sunsetTime = $0.sunset.getDaylightTime()!
            
            if let minutesOfSunlight = getMinutesOfSunlight(from: sunriseTime, to: sunsetTime) {
                totalMinutesOfSunlight += minutesOfSunlight
            }
        }
        
        return getAverageSunlight(minutes: totalMinutesOfSunlight, reports: reports)
    }
    
    private func getMinutesOfSunlight(from sunrise: Date, to sunset: Date) -> Int? {
        let calendar = Calendar.current
        let sunlightMinutes = calendar.dateComponents([.minute], from: sunrise, to: sunset).minute
        return sunlightMinutes
    }
    
    private func getAverageSunlight(minutes: Int, reports: [Report]) -> String {
        let numberOfDays = reports.count
        let averageMinutes = minutes / numberOfDays
        return averageMinutes.formatMinutesToString()
    }
    
    // MARK: Condition Summary
    private func getConditionLabel(from reports: [Report]) -> String {
        let percentage = calculatePercentageSunnyDays(from: reports)
        return String(format: "%.1f", percentage * 100) + "%"
    }
    
    private func calculatePercentageSunnyDays(from reports: [Report]) -> Double {
        var sunnyCount = 0
        reports.forEach {
            if $0.atmoOpacity == "Sunny" {
                sunnyCount += 1
            }
        }
        return Double(sunnyCount) / Double(reports.count)
    }
    
    // MARK: Pressure Summary
    private func getAveragePressureLabel(from reports: [Report]) -> String {
        let averagePressure = calculateAveragePressure(from: reports)
        return String(format: "%.2f", averagePressure) + " Pa"
    }
    
    private func calculateAveragePressure(from reports: [Report]) -> Double {
        var totalPressure: Double = 0
        
        reports.forEach {
            if let pressure = Double($0.pressure) {
                totalPressure += pressure
            }
        }
        
        return totalPressure / Double(reports.count)
    }
}

enum TimeRange {
    case threeMonth
    case sixMonth
    case year
    case twoYear
    case all
}
