//
//  ConditionsChartViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-08.
//

import SwiftUI

@MainActor final class ConditionsChartViewModel: ObservableObject {
    let reports: [Report]
    
    var sunnyPercentage: Double {
        calculatePercentageSunnyDays(from: reports)
    }
    
    var conditionsData: [Condition] {
        var conditionsData = [Condition]()
        reports.forEach { report in
            var description = report.atmoOpacity
            // Display empty data as No Data to user
            if description == "--" {
                description = "No Data"
            }
            // If condition already exists in array
            if let index = conditionsData.firstIndex(where: {$0.description == description}) {
                // Add one to the count
                conditionsData[index].numberOfDays += 1
            } else {
                // Else create new condition and add to array
                let condition = Condition(description: description)
                conditionsData.append(condition)
            }
        }
        return conditionsData
    }
    
    init(reports: [Report]) {
        self.reports = reports
    }
    
    private func calculatePercentageSunnyDays(from reports: [Report]) -> Double {
        var sunnyCount = 0
        reports.forEach {
            if $0.atmoOpacity == "Sunny" {
                sunnyCount += 1
            }
        }
        return Double(sunnyCount) / Double(reports.count)
    }
}


