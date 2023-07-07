//
//  SunlightChartViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-07.
//

import SwiftUI

@MainActor final class SunlightChartViewModel: ObservableObject {
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
    
    init(reports: [Report]) {
        self.reports = reports
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
