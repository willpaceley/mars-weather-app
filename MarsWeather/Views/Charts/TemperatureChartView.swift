//
//  TemperatureChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-04.
//

import SwiftUI
import Charts

struct TemperatureChartView: View {
    let reports: [Report]
    
    var temperatureData: [MarsTemperature] {
        var temperatures = [MarsTemperature]()
        
        reports.forEach {
            let date = $0.terrestrialDate.toDate()!
            
            if let maxTempValue = Int($0.maxTemp), let minTempValue = Int($0.minTemp) {
                let maxTemp = MarsTemperature(type: .maxTemp, temperature: maxTempValue, date: date)
                let minTemp = MarsTemperature(type: .minTemp, temperature: minTempValue, date: date)
                
                temperatures.append(maxTemp)
                temperatures.append(minTemp)
            }
        }
        
        return temperatures
    }
    
    var body: some View {
        Chart(temperatureData) {
            LineMark(
                x: .value("Date", $0.date),
                y: .value("Temperature", $0.temperature)
            )
            .foregroundStyle(by: .value("Type", $0.type.rawValue))
        }
        .frame(maxHeight: 300)
    }
}

struct TemperatureChartView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureChartView(reports: Array(MockData.getMockWeatherData()[0..<31]))
    }
}

struct MarsTemperature: Identifiable {
    let id = UUID()
    let type: TemperatureType
    let temperature: Int
    let date: Date
}

enum TemperatureType: String {
    case maxTemp = "Max Temp"
    case minTemp = "Min Temp"
}
