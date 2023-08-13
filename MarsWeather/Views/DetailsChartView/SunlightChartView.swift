//
//  SunlightChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-07.
//

import SwiftUI
import Charts

struct SunlightChartView: View {
    let reports: [WeatherReport]
    let isShowingSunrise: Bool
    let isShowingSunset: Bool
    
    var body: some View {
            Chart(getChartData(from: reports)) {
                LineMark(x: .value("Date", $0.date, unit: .day),
                         y: .value("Time", $0.time, unit: .minute))
                .foregroundStyle(by: .value("Type", $0.type.rawValue))
            }
        }
    }

struct SunlightChartView_Previews: PreviewProvider {
    static var previews: some View {
        SunlightChartView(
            reports: MockData.getMockWeatherData(),
            isShowingSunrise: true,
            isShowingSunset: false
        )
    }
}

extension SunlightChartView {
    private func getChartData(from reports: [WeatherReport]) -> [MarsSunlight] {
        var sunlightData = [MarsSunlight]()
        
        reports.forEach {
            guard let date = $0.terrestrialDate.toDate() else { return }
            
            if isShowingSunrise {
                let sunriseTime = getSunlightTime(for: $0.sunrise)!
                let sunrise = MarsSunlight(type: .sunrise, date: date, time: sunriseTime)
                sunlightData.append(sunrise)
            }
            
            if isShowingSunset {
                let sunsetTime = getSunlightTime(for: $0.sunset)!
                let sunset = MarsSunlight(type: .sunset, date: date, time: sunsetTime)
                sunlightData.append(sunset)
            }
        }
        
        return sunlightData
    }
    
    private func getSunlightTime(for time: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        if let date = dateFormatter.date(from: time) {
            return date
        } else {
            print("Date from time conversion failed in getSunlightTime function.")
            return nil
        }
    }
}
