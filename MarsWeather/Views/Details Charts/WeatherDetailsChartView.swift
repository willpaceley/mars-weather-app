//
//  WeatherDetailsChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-22.
//

import SwiftUI

struct WeatherDetailsChartView: View {
    let weatherDetail: WeatherDetail
    
    private var icon: String {
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
    
    var body: some View {
        Label(weatherDetail.rawValue.capitalized, systemImage: icon)
            .bold()
            .padding()
        
        Spacer()
    }
}

struct WeatherDetailsChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsChartView(weatherDetail: .temperature)
    }
}
