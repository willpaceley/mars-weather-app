//
//  PressureChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-08.
//

import SwiftUI
import Charts

struct PressureChartView: View {
    @ObservedObject var vm: PressureChartViewModel
    
    var body: some View {
        GroupBox("Average Pressure") {
            HStack {
                Text(String(format: "%.2f", vm.averagePressure) + " Pa")
                    .bold()
                    .foregroundStyle(.primary)
                
                Spacer()
            }
            
            Chart(vm.pressureData) {
                LineMark(x: .value("Date", $0.date),
                         y: .value("Pressure (Pa)", $0.pressure))
                .foregroundStyle(Color.accentColor)
            }
        }
        .fontWeight(.regular)
        .foregroundStyle(.secondary)
        .frame(height: 350)
    }
}

struct PressureChartView_Previews: PreviewProvider {
    static var previews: some View {
        let reports = Array(MockData.getMockWeatherData()[0..<90])
        PressureChartView(vm: PressureChartViewModel(reports: reports))
    }
}
