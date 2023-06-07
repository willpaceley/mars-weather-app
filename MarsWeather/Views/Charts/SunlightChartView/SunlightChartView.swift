//
//  SunlightChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-07.
//

import SwiftUI

struct SunlightChartView: View {
    let reports: [Report]
    
    var sunlightData: [MarsSunlight] {
        var sunlightData = [MarsSunlight]()

        reports.forEach {
            let day = $0.terrestrialDate.toDate()!
            let sunriseTime = getSunlightTime(date: $0.terrestrialDate, time: $0.sunrise)!
            let sunsetTime = getSunlightTime(date: $0.terrestrialDate, time: $0.sunset)!
            
            let sunrise = MarsSunlight(type: .sunrise, day: day, time: sunriseTime)
            let sunset = MarsSunlight(type: .sunset, day: day, time: sunsetTime)
            
            sunlightData.append(sunrise)
            sunlightData.append(sunset)
        }
        
        return sunlightData
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct SunlightChartView_Previews: PreviewProvider {
    static var previews: some View {
        SunlightChartView(reports: Array(MockData.getMockWeatherData()[0..<14]))
    }
}

extension SunlightChartView {
    private func getSunlightTime(date: String, time: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")

        if let date = dateFormatter.date(from: "\(date) \(time)") {
            return date
        } else {
            print("Date conversion failed in getSunlightTime function.")
            return nil
        }
    }
}

struct MarsSunlight: Identifiable {
    let id = UUID()
    let type: SunlightType
    let day: Date
    let time: Date
}

enum SunlightType: String {
    case sunrise = "Sunrise"
    case sunset = "Sunset"
}
