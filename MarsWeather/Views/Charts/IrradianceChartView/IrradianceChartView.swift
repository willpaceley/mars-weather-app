//
//  IrradianceChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-15.
//

import SwiftUI
import Charts

struct IrradianceChartView: View {
    @ObservedObject var vm: IrradianceChartViewModel
    
    var body: some View {
        GroupBox("Most Frequent UV Index") {
            HStack {
                Text(vm.mostFrequentUVIndex)
                    .bold()
                    .foregroundStyle(.primary)
                
                Spacer()
            }
            
            Chart(vm.irradianceData) {
                PointMark(x: .value("Date", $0.date),
                          y: .value("Irradiance", $0.irradiance))
                .foregroundStyle(Color.accentColor)
            }
        }
        .fontWeight(.regular)
        .foregroundStyle(.secondary)
        .frame(height: 350)
    }
}

struct IrradianceChartView_Previews: PreviewProvider {
    static var previews: some View {
        let reports = Array(MockData.getMockWeatherData()[0..<90])
        IrradianceChartView(vm: IrradianceChartViewModel(reports: reports))
    }
}
