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
    @Published var isLoading = true
    @Published var isShowingInfo = false
    @Published var isPresentingAlert = false
    @Published var isShowingDetailsChart = false
    @Published var alert = AlertContext.defaultAlert
    
    // MARK: Properties
    let dataProvider: MarsWeatherDataProvider
    
    var selectedWeatherDetail: WeatherDetail?
    
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
                // If not forced to fetch from API, check cache for unexpired data
                if !forceFetch {
                    isLoading = true
                    if let cachedWeatherData = MWCache.shared.getMarsWeatherData() {
                        reports = cachedWeatherData.soles
                    } else {
                        // If no data found in cache, fetch fresh data from provider
                        reports = try await fetchMarsWeatherReports()
                    }
                } else {
                    reports = try await fetchMarsWeatherReports()
                }
                
                // Set the initial selected report to most recent
                if !reports.isEmpty {
                    selectedReport = reports[0]
                }
            } catch {
                showAlert(for: error)
            }
        
        isLoading = false
    }
    
    func showChart(for weatherDetail: WeatherDetail) {
        selectedWeatherDetail = weatherDetail
        isShowingDetailsChart = true
    }

    // MARK: Private Methods
    private func fetchMarsWeatherReports() async throws -> [WeatherReport] {
        let weatherData = try await dataProvider.getMarsWeatherData()
        // Cache the weather data returned from the API
        try MWCache.shared.insert(weatherData)
        return weatherData.soles
    }
    
    private func showAlert(for error: Error) {
        if let mwError = error as? MWError {
            switch mwError {
            case .defaultError:
                alert = AlertContext.defaultAlert
                
            case .invalidURL:
                alert = AlertContext.invalidURL
                
            case .invalidResponse(let statusCode):
                alert = AlertContext.invalidResponse(for: statusCode)

            case .decodingError(let error):
                alert = AlertContext.decodingError(error)

            case .cacheError(let error):
                alert = AlertContext.cacheError(error)
                
            case .genericError(let error):
                alert = AlertContext.genericError(error)
            }
        } else {
            alert = AlertContext.genericError(error)
        }
        
        isLoading = false
        isPresentingAlert = true
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

// MARK: - WeatherDetail Enum
enum WeatherDetail: String {
    case temperature
    case daylight
    case conditions
    case pressure
    case irradiance
}
