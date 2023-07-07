//
//  SunlightChartViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-07.
//

import SwiftUI

@MainActor final class SunlightChartViewModel: ObservableObject {
    let reports: [Report]
    let isShowingSunrise: Binding<Bool>
    let isShowingSunset: Binding<Bool>
    
    var sunlightData: [MarsSunlight] {
        getSunlightData(from: reports)
    }
    
    init(reports: [Report], isShowingSunrise: Binding<Bool>, isShowingSunset: Binding<Bool>) {
        self.reports = reports
        self.isShowingSunrise = isShowingSunrise
        self.isShowingSunset = isShowingSunset
    }
    
    private func getSunlightData(from: [Report]) -> [MarsSunlight] {
        var sunlightData = [MarsSunlight]()

        reports.forEach {
            let date = $0.terrestrialDate.toDate()!
            
            if isShowingSunrise.wrappedValue {
                let sunriseTime = getSunlightTime(for: $0.sunrise)!
                let sunrise = MarsSunlight(type: .sunrise, date: date, time: sunriseTime)
                sunlightData.append(sunrise)
            }
            
            if isShowingSunset.wrappedValue {
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
