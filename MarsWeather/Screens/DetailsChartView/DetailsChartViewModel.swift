//
//  DetailsChartViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-29.
//

import SwiftUI

@MainActor final class DetailsChartViewModel: ObservableObject {
    let weatherDetail: WeatherDetail
    let reports: [Report]
    
    var icon: String {
        switch weatherDetail {
        case .temperature:
            return "thermometer.medium"
        case .sunlight:
            return "sun.and.horizon.fill"
        case .conditions:
            return "cloud.sun.fill"
        case .pressure:
            return "gauge.medium"
        case .irradiance:
            return "sun.max.fill"
        }
    }
    
    init(weatherDetail: WeatherDetail, reports: [Report]) {
        self.weatherDetail = weatherDetail
        self.reports = reports
    }
}
