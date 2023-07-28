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
    
    var chartData: [ChartData] {
        switch chartType {
        default:
            WeatherDetailsViewModel.getTemperatureData(
                from: selectedReports,
                isShowingAirTemp: isShowingAirTemp,
                isShowingGroundTemp: isShowingGroundTemp
            )
        }
    }
    
    // TODO: Shouldn't need this after the end of the refactor?
    var selectedReports: [Report] {
        getReportSelection(for: selectedTimeRange)
    }
    
    var icon: String {
        getIcon(for: self.chartType)
    }
    
    var description: String {
        getDescription(for: self.chartType)
    }
    
    var chartSummaryTitle: String {
        getSummaryTitle(for: chartType)
    }
    
    init(weatherDetail: WeatherDetail, reports: [Report]) {
        self.chartType = weatherDetail
        self.reports = reports
    }
    
    func getMonthNumber(of month: MarsMonth) -> Int {
        let numberString = String(month.rawValue.split(separator: " ")[1])
        let monthNumber = Int(numberString)!
        return monthNumber
    }
    
    func getSummary(for chartType: WeatherDetail, from reports: [Report]) -> String {
        switch chartType {
        case .temperature:
            let temperatureData = WeatherDetailsViewModel.getTemperatureData(
                from: selectedReports,
                isShowingAirTemp: isShowingAirTemp,
                isShowingGroundTemp: isShowingGroundTemp
            )
            let averageTemperature = calculateAverageTemperature(from: temperatureData)
            return String(format: "%.1f", averageTemperature) + " °C"
        case .daylight:
            return "Daylight Summary"
        case .conditions:
            return "Conditions Summary"
        case .pressure:
            return "Pressure Summary"
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
    
    // MARK: - Chart Data Methods
    // Chart methods must be static in order to call from Previews
    static func getTemperatureData(from reports: [Report], isShowingAirTemp: Bool, isShowingGroundTemp: Bool) -> [ChartData] {
        var chartData = [ChartData]()
        
        reports.forEach {
            let date = $0.terrestrialDate.toDate()!
            
            if isShowingAirTemp {
                if let maxTempValue = Int($0.maxTemp), let minTempValue = Int($0.minTemp)
                {
                    let maxAirTemp = ChartData(xAxis: date, yAxis: maxTempValue, type: .maxAirTemp)
                    let minAirTemp = ChartData(xAxis: date, yAxis: minTempValue, type: .minAirTemp)
                    
                    chartData.append(maxAirTemp)
                    chartData.append(minAirTemp)
                }
            }
            
            if isShowingGroundTemp {
                if let maxGtsValue = Int($0.maxGtsTemp), let minGtsValue = Int($0.minGtsTemp) {
                    let maxGtsTemp = ChartData(xAxis: date, yAxis: maxGtsValue, type: .maxGroundTemp)
                    let minGtsTemp = ChartData(xAxis: date, yAxis: minGtsValue, type: .minGroundTemp)
                    
                    chartData.append(maxGtsTemp)
                    chartData.append(minGtsTemp)
                }
            }
        }
        return chartData
    }
    
    private func calculateAverageTemperature(from temperatureData: [ChartData]) -> Double {
        var totalTemperature = 0
        
        for temp in temperatureData {
            totalTemperature += temp.yAxis as! Int
        }
        
        return Double(totalTemperature) / Double(temperatureData.count)
    }
}

enum TimeRange {
    case threeMonth
    case sixMonth
    case year
    case twoYear
    case all
}

struct ChartData: Identifiable {
    let id = UUID()
    let xAxis: any Plottable
    let yAxis: any Plottable
    var type: ChartDataType? = nil
}

enum ChartDataType: String {
    case maxAirTemp = "Max Air"
    case minAirTemp = "Min Air"
    case maxGroundTemp = "Max Ground"
    case minGroundTemp = "Min Ground"
}
