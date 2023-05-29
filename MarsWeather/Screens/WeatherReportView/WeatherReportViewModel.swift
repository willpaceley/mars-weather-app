//
//  WeatherReportViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-22.
//

import SwiftUI

@MainActor final class WeatherReportViewModel: ObservableObject {
    @Published var isShowingDetailsChart = false
    
    let selectedReport: Report
    let reports: [Report]
    var selectedWeatherDetail: WeatherDetail?
    
    init(selectedReport: Report, reports: [Report]) {
        self.selectedReport = selectedReport
        self.reports = reports
    }
    
    func showChart(for weatherDetail: WeatherDetail) {
        selectedWeatherDetail = weatherDetail
        isShowingDetailsChart = true
    }
}

enum WeatherDetail: String {
    case temperature
    case daylight
    case conditions
    case pressure
    case irradiance
}
