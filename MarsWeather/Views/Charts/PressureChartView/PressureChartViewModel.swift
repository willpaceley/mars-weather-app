//
//  PressureChartViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-08.
//

import SwiftUI

@MainActor final class PressureChartViewModel: ObservableObject {
    let reports: [Report]
    
    var pressureData: [PressureData] {
        var pressureData = [PressureData]()
        
        reports.forEach {
            guard let date = $0.terrestrialDate.toDate() else { return }
            guard let pressure = Int($0.pressure) else { return }
            pressureData.append(PressureData(date: date, pressure: pressure))
        }
        
        return pressureData
    }
    
    var averagePressure: Double {
        var totalPressure: Double = 0
        
        reports.forEach {
            if let pressure = Double($0.pressure) {
                totalPressure += pressure
            }
        }
        
        return totalPressure / Double(reports.count)
    }
    
    init(reports: [Report]) {
        self.reports = reports
    }
}

struct PressureData: Identifiable {
    let id = UUID()
    let date: Date
    let pressure: Int
}
