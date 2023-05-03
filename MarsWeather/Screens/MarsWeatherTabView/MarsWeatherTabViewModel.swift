//
//  MarsWeatherTabViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import SwiftUI

@MainActor final class MarsWeatherTabViewModel: ObservableObject {
    @Published var sols: [Sol]?
    @Published var isLoading = false
    @Published var isPresentingAlert = false
    @Published var alert = AlertContext.defaultAlert
    
    var descriptions: Descriptions?
    
    func getWeatherData() {
        isLoading = true
        
        Task {
            do {
                let weatherData = try await NetworkProvider.shared.getMarsWeatherData()
                sols = weatherData.soles
                descriptions = weatherData.descriptions
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
