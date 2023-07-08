//
//  ConditionsChartViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-08.
//

import SwiftUI

@MainActor final class ConditionsChartViewModel: ObservableObject {
    let reports: [Report]
    
    var conditionsData: [Condition] {
        var conditionsData = [Condition]()
        reports.forEach { report in
            let description = report.atmoOpacity
            // Skip displaying empty data from chart
            if description == "--" { return }
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
}

struct Condition: Identifiable {
    let id = UUID()
    let description: String
    var numberOfDays: Int = 0
}
