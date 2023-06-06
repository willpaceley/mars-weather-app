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
    
    @State private var isShowingAirTemp = true
    @State private var isShowingGroundTemp = false
    
    var temperatureData: [MarsTemperature] {
        var temperatures = [MarsTemperature]()
        
        reports.forEach {
            let date = $0.terrestrialDate.toDate()!
            
            if isShowingAirTemp {
                if let maxTempValue = Int($0.maxTemp), let minTempValue = Int($0.minTemp)
                {
                    let maxAirTemp = MarsTemperature(type: .maxAirTemp, temperature: maxTempValue, date: date)
                    let minAirTemp = MarsTemperature(type: .minAirTemp, temperature: minTempValue, date: date)
                    
                    temperatures.append(maxAirTemp)
                    temperatures.append(minAirTemp)
                }
            }
            
            if isShowingGroundTemp {
                if let maxGtsValue = Int($0.maxGtsTemp), let minGtsValue = Int($0.minGtsTemp) {
                    let maxGtsTemp = MarsTemperature(type: .maxGroundTemp, temperature: maxGtsValue, date: date)
                    let minGtsTemp = MarsTemperature(type: .minGroundTemp, temperature: minGtsValue, date: date)
                    
                    temperatures.append(maxGtsTemp)
                    temperatures.append(minGtsTemp)
                }
            }
        }
        
        return temperatures
    }
    
    var body: some View {
        VStack {
            Chart(temperatureData) {
                LineMark(
                    x: .value("Date", $0.date),
                    y: .value("Temperature", $0.temperature)
                )
                .foregroundStyle(by: .value("Type", $0.type.rawValue))
            }
            .frame(maxHeight: 300)
            
            Toggle("Air Temperature", isOn: $isShowingAirTemp)
                .foregroundColor(.secondary)
                .disabled(!isShowingGroundTemp)
            
            Toggle("Ground Temperature", isOn: $isShowingGroundTemp)
                .foregroundColor(.secondary)
                .disabled(!isShowingAirTemp)
        }
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
    case maxAirTemp = "Max Air"
    case minAirTemp = "Min Air"
    case maxGroundTemp = "Max Ground"
    case minGroundTemp = "Min Ground"
}
