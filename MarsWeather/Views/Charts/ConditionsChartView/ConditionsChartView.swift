//
//  ConditionChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-08.
//

import SwiftUI
import Charts

struct ConditionsChartView: View {
    let reports: [Report]
    
    var conditionsData: [Condition] {
        var conditionsData = [Condition]()
        reports.forEach { report in
            let description = report.atmoOpacity
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
    
    var body: some View {
        Chart(conditionsData) {
            BarMark(x: .value("Condition", $0.description),
                    y: .value("Number of Days", $0.numberOfDays),
                    width: .fixed(50))
        }
        .frame(height: 300)
    }
}

#Preview {
    let reports = Array(MockData.getMockWeatherData()[0..<31])
    return ConditionsChartView(reports: reports)
}

struct Condition: Identifiable {
    let id = UUID()
    let description: String
    var numberOfDays: Int = 0
}
