//
//  SunlightChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-07.
//

import SwiftUI
import Charts

struct SunlightChartView: View {
    @ObservedObject var vm: SunlightChartViewModel
    
    var body: some View {
        Chart(vm.sunlightData) {
            LineMark(x: .value("Date", $0.date, unit: .day),
                     y: .value("Time", $0.time, unit: .minute))
            .foregroundStyle(by: .value("Type", $0.type.rawValue))
        }
        .frame(height: 300)
    }
}

struct SunlightChartView_Previews: PreviewProvider {
    static var previews: some View {
        SunlightChartView(vm: SunlightChartViewModel(
            reports: Array(MockData.getMockWeatherData()[0..<31]))
        )
    }
}
