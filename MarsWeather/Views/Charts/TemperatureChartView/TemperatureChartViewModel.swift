//
//  TemperatureChartViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-05.
//

import SwiftUI

@MainActor final class TemperatureChartViewModel: ObservableObject {
    let reports: [Report]
    
    let isShowingAirTemp: Binding<Bool>
    let isShowingGroundTemp: Binding<Bool>
    
    var temperatureData: [MarsTemperature] {
        getMarsTemperatures(from: reports)
    }
    
    init(reports: [Report], isShowingAirTemp: Binding<Bool>, isShowingGroundTemp: Binding<Bool>) {
        self.reports = reports
        self.isShowingAirTemp = isShowingAirTemp
        self.isShowingGroundTemp = isShowingGroundTemp
    }
    
    private func getMarsTemperatures(from reports: [Report]) -> [MarsTemperature] {
        var temperatures = [MarsTemperature]()
        
        reports.forEach {
            let date = $0.terrestrialDate.toDate()!
            
            if isShowingAirTemp.wrappedValue {
                if let maxTempValue = Int($0.maxTemp), let minTempValue = Int($0.minTemp)
                {
                    let maxAirTemp = MarsTemperature(type: .maxAirTemp, temperature: maxTempValue, date: date)
                    let minAirTemp = MarsTemperature(type: .minAirTemp, temperature: minTempValue, date: date)
                    
                    temperatures.append(maxAirTemp)
                    temperatures.append(minAirTemp)
                }
            }
            
            if isShowingGroundTemp.wrappedValue {
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
