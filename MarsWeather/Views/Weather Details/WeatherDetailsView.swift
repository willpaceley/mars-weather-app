//
//  WeatherDetailsView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-12.
//

import SwiftUI

struct WeatherDetailsView: View {
    @State private var isShowingChartSheet = false
    @State private var selectedWeatherDetail: WeatherDetail?
    
    let report: Report
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                TemperatureView(report: report)
                    .onTapGesture { showChart(for: .temperature) }
                
                SunPositionTimeView(report: report)
                    .onTapGesture { showChart(for: .sunlight) }
            }

            HStack(spacing: 8) {
                ConditionsView(atmoOpacity: report.atmoOpacity)
                    .onTapGesture { showChart(for: .conditions) }
                
                PressureView(report: report)
                    .onTapGesture { showChart(for: .pressure) }
                
                UVIrradianceView(irradianceIndex: report.localUvIrradianceIndex)
                    .onTapGesture { showChart(for: .irradiance) }
            }
        }
        .sheet(isPresented: $isShowingChartSheet) {
            if let selectedWeatherDetail {
                WeatherDetailsChartView(weatherDetail: selectedWeatherDetail)
            } else {
                Text("selectedWeatherDetail is nil")
            }
        }
    }
}

struct WeatherDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(report: MockData.report)
    }
}

extension WeatherDetailsView {
    private func showChart(for weatherDetail: WeatherDetail) {
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
