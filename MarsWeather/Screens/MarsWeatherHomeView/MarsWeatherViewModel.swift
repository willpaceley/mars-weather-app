//
//  MarsWeatherViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import SwiftUI

@MainActor final class MarsWeatherViewModel: ObservableObject {
    @Published var reports = [WeatherReport]()
    @Published var selectedReport: WeatherReport?
    @Published var isLoading = false
    @Published var isPresentingAlert = false
    @Published var isShowingInfo = false
    @Published var alert = AlertContext.defaultAlert
    
    let dataProvider: MarsWeatherDataProvider
    
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
    
    init(dataProvider: MarsWeatherDataProvider) {
        self.dataProvider = dataProvider
    }
    
    // MARK: - Public Methods
    func getWeatherData(forceFetch: Bool = false) async {
            do {
                if !forceFetch {
                    if let cachedWeatherData = MWCache.shared.getMarsWeatherData() {
                        reports = cachedWeatherData.soles
                    }
                } else {
                    isLoading = true
                    let weatherData = try await dataProvider.getMarsWeatherData()
                    reports = weatherData.soles
                    isLoading = false
                    
                    // Cache the weather data returned from the API
                    try MWCache.shared.insert(weatherData)
                }
                
                if !reports.isEmpty {
                    selectedReport = reports[0]
                }
            } catch {
                if let mwError = error as? MWError {
                    switch mwError {
                    case .invalidURL:
                        alert = AlertContext.invalidURL

                    case .invalidData:
                        alert = AlertContext.invalidData

                    case .invalidResponse:
                        alert = AlertContext.invalidResponse

                    case .unableToComplete:
                        alert = AlertContext.unableToComplete
                    }
                } else {
                    alert = AlertContext.defaultAlert
                }

                isLoading = false
                isPresentingAlert = true
            }
    }
    
    // MARK: Private Methods
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
