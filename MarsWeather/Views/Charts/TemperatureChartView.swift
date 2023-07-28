//
//  TemperatureChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-04.
//

import SwiftUI
import Charts

struct TemperatureChartView: View {
    let temperatureData: [ChartData]
    
    var body: some View {
        Chart(temperatureData) {
            LineMark(
                x: .value("Date", $0.xAxis as! Date, unit: .day),
                y: .value("Temperature", $0.yAxis as! Int)
            )
            .foregroundStyle(by: .value("Type", $0.type!.rawValue))
        }
        .frame(height: 275)
    }
}

struct TemperatureChartView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureChartView(
            temperatureData: WeatherDetailsViewModel.getTemperatureData(
                from: Array(MockData.getMockWeatherData()[0..<90]),
                isShowingAirTemp: true,
                isShowingGroundTemp: false
            )
        )
    }
}
