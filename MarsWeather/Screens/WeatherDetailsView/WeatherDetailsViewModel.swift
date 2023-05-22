//
//  WeatherDetailsViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-22.
//

import SwiftUI

@MainActor final class WeatherDetailsViewModel: ObservableObject {
    @Published var isShowingChartSheet = false
    
    let report: Report
    var selectedWeatherDetail: WeatherDetail?
    
    init(report: Report) {
        self.report = report
    }
    
    func showChart(for weatherDetail: WeatherDetail) {
        print("Clicked on \(weatherDetail)")
        selectedWeatherDetail = weatherDetail
        isShowingChartSheet = true
    }
}

enum WeatherDetail: String {
    case temperature
    case sunlight
    case conditions
    case pressure
    case irradiance
}
