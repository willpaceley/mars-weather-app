//
//  SunlightChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-07.
//

import SwiftUI
import Charts

struct SunlightChartView: View {
    let daylightData: [ChartData]
    
    var body: some View {
            Chart(daylightData) {
                LineMark(x: .value("Date", $0.xAxis as! Date, unit: .day),
                         y: .value("Time", $0.yAxis as! Date, unit: .minute))
                .foregroundStyle(by: .value("Type", $0.type!.rawValue))
            }
            .frame(height: 275)
        }
    }

struct SunlightChartView_Previews: PreviewProvider {
    static var previews: some View {
        SunlightChartView(
            daylightData: WeatherDetailsViewModel.getDaylightData(
                from: MockData.getMockWeatherData(),
                isShowingSunset: true,
                isShowingSunrise: false
            )
        )
    }
}
