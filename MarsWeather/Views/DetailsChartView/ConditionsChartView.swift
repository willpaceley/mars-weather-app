//
//  ConditionChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-08.
//

import SwiftUI
import Charts

struct ConditionsChartView: View {
    let reports: [WeatherReport]
    
    var body: some View {
            Chart(getChartData(from: reports)) {
                BarMark(x: .value("Condition", $0.description),
                        y: .value("Number of Days", $0.numberOfDays),
                        width: .fixed(50))
                .foregroundStyle(Color.accentColor)
            }
    }
}

struct ConditionsChartView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsChartView(reports: Array(MockData.getMockWeatherData()[0..<90]))
    }
}

extension ConditionsChartView {
    private func getChartData(from reports: [WeatherReport]) -> [Condition] {
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
}
