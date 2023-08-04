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
    
    init(dataProvider: MarsWeatherDataProvider) {
        self.dataProvider = dataProvider
    }
    
    // MARK: - Public Methods
    func getWeatherData() {
        isLoading = true

        Task {
            do {
                if let cachedWeatherData = MWCache.shared.getMarsWeatherData() {
                    reports = cachedWeatherData.soles
                } else {
                    let weatherData = try await dataProvider.getMarsWeatherData()
                    reports = weatherData.soles
                    try MWCache.shared.insert(weatherData)
                }
                
                if !reports.isEmpty {
                    selectedReport = reports[0]
                }
                
                isLoading = false
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
    }
}
