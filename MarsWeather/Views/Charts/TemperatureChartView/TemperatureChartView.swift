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
            GroupBox("Average Temperature") {
                
                HStack {
                    Text("\(vm.averageTemperature) °C")
                        .bold()
                        .foregroundStyle(.primary)
                    
                    Spacer()
                }
                
                Chart(vm.temperatureData) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .day),
                        y: .value("Temperature", $0.temperature)
                    )
                    .foregroundStyle(by: .value("Type", $0.type.rawValue))
                }
            }
            .fontWeight(.regular)
            .foregroundStyle(.secondary)
            .frame(height: 350)
            
            
            Toggle("Air Temperature", isOn: vm.isShowingAirTemp)
                .foregroundColor(.secondary)
                .disabled(!vm.isShowingGroundTemp.wrappedValue)
            
            Toggle("Ground Temperature", isOn: vm.isShowingGroundTemp)
                .foregroundColor(.secondary)
                .disabled(!vm.isShowingAirTemp.wrappedValue)
        }
    }
}

struct TemperatureChartView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureChartView(vm: TemperatureChartViewModel(reports: Array(MockData.getMockWeatherData()[0..<31]),
                                                           isShowingAirTemp: .constant(true),
                                                           isShowingGroundTemp: .constant(false)))
    }
}
