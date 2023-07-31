//
//  LatestWeatherViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-17.
//

import Foundation

@MainActor final class LatestWeatherViewModel: ObservableObject {
    @Published var selectedReport: WeatherReport
    
    let reports: [WeatherReport]
    
    init(reports: [WeatherReport]) {
        self.reports = reports
        self.selectedReport = reports[0]
    }
    
    var recentReports: [WeatherReport] {
        let count = reports.count
        let range = count > 13 ? 0..<29 : 0..<count
        return Array(reports[range])
    }
    var lowestTemp: Int {
        calculateLowestTemp(from: recentReports)
    }
    var highestTemp: Int {
        calculateHighestTemp(from: recentReports)
    }
    
    private func calculateLowestTemp(from recentReports: [WeatherReport]) -> Int {
        let lowestReport = recentReports.min { a, b in
            return Int(a.minTemp) ?? 0 < Int(b.minTemp) ?? 0
        }
        if let lowestReport {
            return Int(lowestReport.minTemp) ?? 0
        }
        return 0
    }
    
    private func calculateHighestTemp(from recentReports: [WeatherReport]) -> Int {
        let highestReport = recentReports.max { a, b in
            return Int(a.maxTemp) ?? 0 < Int(b.maxTemp) ?? 0
        }
        if let highestReport {
            return Int(highestReport.maxTemp) ?? 0
        }
        return 0
    }
}
