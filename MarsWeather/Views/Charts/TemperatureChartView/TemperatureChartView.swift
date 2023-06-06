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
                    x: .value("Date", $0.date),
                    y: .value("Temperature", $0.temperature)
                )
                .foregroundStyle(by: .value("Type", $0.type.rawValue))
            }
            .frame(maxHeight: 300)
            
            Toggle("Air Temperature", isOn: $vm.isShowingAirTemp)
                .foregroundColor(.secondary)
                .disabled(!vm.isShowingGroundTemp)
            
            Toggle("Ground Temperature", isOn: $vm.isShowingGroundTemp)
                .foregroundColor(.secondary)
                .disabled(!vm.isShowingAirTemp)
        }
    }
}

struct TemperatureChartView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureChartView(vm: TemperatureChartViewModel(reports: Array(MockData.getMockWeatherData()[0..<31])))
    }
}
