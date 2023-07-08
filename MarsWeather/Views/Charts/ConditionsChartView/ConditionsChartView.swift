//
//  ConditionChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-08.
//

import SwiftUI
import Charts

struct ConditionsChartView: View {
    @ObservedObject var vm: ConditionsChartViewModel
    
    var body: some View {
        Chart(vm.conditionsData) {
            BarMark(x: .value("Condition", $0.description),
                    y: .value("Number of Days", $0.numberOfDays),
                    width: .fixed(50))
        }
        .frame(height: 300)
    }
}

struct ConditionsChartView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsChartView(vm: ConditionsChartViewModel(
            reports: Array(MockData.getMockWeatherData()[0..<31])))
    }
}
