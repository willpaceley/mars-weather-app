//
//  IrradianceChartViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-16.
//

import Foundation

@MainActor
final class IrradianceChartViewModel: ObservableObject {
    let reports: [Report]
    
    var irradianceData: [MarsIrradianceData] {
        reports.map { report in
            let date = report.terrestrialDate.toDate()!
            let irradiance: String
            
            switch report.localUvIrradianceIndex {
            case .empty:
                irradiance = "No Data"
            case .veryHigh:
                irradiance =  "Very High"
            default:
                irradiance = report.localUvIrradianceIndex.rawValue
            }
            
            return MarsIrradianceData(date: date, irradiance: irradiance)
        }
    }
    
    init(reports: [Report]) {
        self.reports = reports
    }
}

struct MarsIrradianceData: Identifiable {
    let id = UUID()
    let date: Date
    let irradiance: String
}
