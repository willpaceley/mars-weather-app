//
//  WeatherReportViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-22.
//

import SwiftUI

@MainActor final class WeatherReportViewModel: ObservableObject {
    @Published var isShowingDetailsChart = false
    
    let selectedReport: WeatherReport
    let reports: [WeatherReport]
    var selectedWeatherDetail: WeatherDetail?
    
    init(selectedReport: WeatherReport, reports: [WeatherReport]) {
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
