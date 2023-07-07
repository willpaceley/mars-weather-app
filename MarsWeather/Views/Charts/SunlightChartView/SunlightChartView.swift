//
//  SunlightChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-07.
//

import SwiftUI
import Charts

struct SunlightChartView: View {
    let reports: [Report]
    
    var sunlightData: [MarsSunlight] {
        var sunlightData = [MarsSunlight]()

        reports.forEach {
            let date = $0.terrestrialDate.toDate()!
            let sunriseTime = getSunlightTime(for: $0.sunrise)!
            let sunsetTime = getSunlightTime(for: $0.sunset)!
            
            let sunrise = MarsSunlight(type: .sunrise, date: date, time: sunriseTime)
            let sunset = MarsSunlight(type: .sunset, date: date, time: sunsetTime)
            
            sunlightData.append(sunrise)
            sunlightData.append(sunset)
        }
        
        return sunlightData
    }
    
    var body: some View {
        Chart(sunlightData) {
            LineMark(x: .value("Date", $0.date, unit: .day),
                     y: .value("Time", $0.time, unit: .minute))
            .foregroundStyle(by: .value("Type", $0.type.rawValue))
        }
        .frame(height: 300)
    }
}

struct SunlightChartView_Previews: PreviewProvider {
    static var previews: some View {
        SunlightChartView(reports: Array(MockData.getMockWeatherData()[0..<90]))
    }
}

extension SunlightChartView {
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

struct MarsSunlight: Identifiable {
    let id = UUID()
    let type: SunlightType
    let date: Date
    let time: Date
}

enum SunlightType: String {
    case sunrise = "Sunrise"
    case sunset = "Sunset"
}
