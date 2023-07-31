//
//  TemperatureChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-04.
//

import SwiftUI
import Charts

struct TemperatureChartView: View {
    let reports: [WeatherReport]
    let isShowingAirTemp: Bool
    let isShowingGroundTemp: Bool
    
    var body: some View {
        Chart(getChartData(from: reports)) {
            LineMark(
                x: .value("Date", $0.date, unit: .day),
                y: .value("Temperature", $0.temperature)
            )
            .foregroundStyle(by: .value("Type", $0.type.rawValue))
        }
        .frame(height: 275)
    }
}

struct TemperatureChartView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureChartView(
            reports: MockData.getMockWeatherData(),
            isShowingAirTemp: true,
            isShowingGroundTemp: false
        )
    }
}

extension TemperatureChartView {
    private func getChartData(from reports: [WeatherReport]) -> [MarsTemperature] {
            var temperatures = [MarsTemperature]()
            
            reports.forEach {
                let date = $0.terrestrialDate.toDate()!
                
                if isShowingAirTemp {
                    if let maxTempValue = Int($0.maxTemp), let minTempValue = Int($0.minTemp)
                    {
                        let maxAirTemp = MarsTemperature(
                            type: .maxAirTemp,
                            temperature: maxTempValue,
                            date: date
                        )
                        let minAirTemp = MarsTemperature(
                            type: .minAirTemp,
                            temperature: minTempValue,
                            date: date
                        )
                        
                        temperatures.append(maxAirTemp)
                        temperatures.append(minAirTemp)
                    }
                }
                
                if isShowingGroundTemp {
                    if let maxGtsValue = Int($0.maxGtsTemp), let minGtsValue = Int($0.minGtsTemp) {
                        let maxGtsTemp = MarsTemperature(
                            type: .maxGroundTemp,
                            temperature: maxGtsValue,
                            date: date
                        )
                        let minGtsTemp = MarsTemperature(
                            type: .minGroundTemp,
                            temperature: minGtsValue,
                            date: date
                        )
                        
                        temperatures.append(maxGtsTemp)
                        temperatures.append(minGtsTemp)
                    }
                }
            }
            
            return temperatures
        }
}
