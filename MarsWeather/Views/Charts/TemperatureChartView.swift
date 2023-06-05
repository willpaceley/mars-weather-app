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
            let maxTemp = MarsTemperature(type: .maxTemp,
                                          temperature: Int($0.maxTemp)!,
                                          date: date)
            temperatures.append(maxTemp)
            
            let minTemp = MarsTemperature(type: .minTemp,
                                          temperature: Int($0.minTemp)!,
                                          date: date)
            
            temperatures.append(minTemp)
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
        .frame(maxHeight: 250)
    }
}

struct TemperatureChartView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureChartView(reports: Array(MockData.getMockWeatherData()[0..<14]))
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
