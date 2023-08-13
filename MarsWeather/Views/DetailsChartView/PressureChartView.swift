//
//  PressureChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-08.
//

import SwiftUI
import Charts

struct PressureChartView: View {
    let reports: [WeatherReport]
    
    var body: some View {
            Chart(getChartData(from: reports)) {
                LineMark(x: .value("Date", $0.date),
                         y: .value("Pressure (Pa)", $0.pressure))
                .foregroundStyle(Color.accentColor)
            }
    }
}

struct PressureChartView_Previews: PreviewProvider {
    static var previews: some View {
        PressureChartView(reports: Array(MockData.getMockWeatherData()[0..<90]))
    }
}

extension PressureChartView {
    private func getChartData(from reports: [WeatherReport]) -> [PressureData] {
        var pressureData = [PressureData]()
        
        reports.forEach {
            guard let date = $0.terrestrialDate.toDate() else { return }
            guard let pressure = Int($0.pressure) else { return }
            pressureData.append(PressureData(date: date, pressure: pressure))
        }
        
        return pressureData
    }
}
