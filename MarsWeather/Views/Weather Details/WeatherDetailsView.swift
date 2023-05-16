//
//  WeatherDetailsView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-12.
//

import SwiftUI

struct WeatherDetailsView: View {
    let report: Report
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                TemperatureView(report: report)
                SunPositionTimeView(report: report)
            }

            HStack(spacing: 8) {
                ConditionsView(atmoOpacity: report.atmoOpacity)
                PressureView(report: report)
                UVIrradianceView(irradianceIndex: report.localUvIrradianceIndex)
            }
        }
    }
}

struct WeatherDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(report: MockData.report)
    }
}
