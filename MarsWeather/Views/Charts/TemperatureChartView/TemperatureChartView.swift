//
//  TemperatureChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-04.
//

import SwiftUI
import Charts

struct TemperatureChartView: View {
    @ObservedObject var vm: TemperatureChartViewModel
    
    var body: some View {
        VStack {
                Chart(vm.temperatureData) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .day),
                        y: .value("Temperature", $0.temperature)
                    )
                    .foregroundStyle(by: .value("Type", $0.type.rawValue))
                }
                .frame(height: 275)
        }
    }
}

struct TemperatureChartView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureChartView(
            vm: TemperatureChartViewModel(
                reports: MockData.getMockWeatherData(),
                isShowingAirTemp: .constant(true),
                isShowingGroundTemp: .constant(false)
            )
        )
    }
}
