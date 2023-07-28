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
            let irradiance = formatUVIndexString(from: report.localUvIrradianceIndex)
            return MarsIrradianceData(date: date, irradiance: irradiance)
        }
    }
    
    var mostFrequentUVIndex: String {
        let indexCounts = calculateUVIndexCounts(from: reports)
        
        // Determine most common irradiance index
        var mostFrequentIndex: UVIrradianceIndex = .empty
        var maxCount = 0
        
        for key in indexCounts.keys {
            if let count = indexCounts[key] {
                // current intensity has a greater count of occurrences
                if count > maxCount {
                    mostFrequentIndex = key
                    maxCount = count
                }
            }
        }
        
        return formatUVIndexString(from: mostFrequentIndex)
    }
    
    init(reports: [Report]) {
        self.reports = reports
    }
    
    private func calculateUVIndexCounts(from reports: [Report]) -> [UVIrradianceIndex: Int] {
        let intensities = reports.map { ($0.localUvIrradianceIndex, 1) }
        let intensityCounts = Dictionary(intensities, uniquingKeysWith: +)
        return intensityCounts
    }
    
    private func formatUVIndexString(from index: UVIrradianceIndex) -> String {
        let formattedResult: String
        switch index {
        case .empty:
            formattedResult = "No Data"
        case .veryHigh:
            formattedResult = "Very High"
        default:
            formattedResult = index.rawValue
        }
        return formattedResult
    }
}

struct MarsIrradianceData: Identifiable {
    let id = UUID()
    let date: Date
    let irradiance: String
}
