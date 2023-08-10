//
//  IrradianceChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-15.
//

import SwiftUI
import Charts

struct IrradianceChartView: View {
    let reports: [WeatherReport]
    
    var body: some View {
        Chart(getChartData(from: reports)) {
            PointMark(x: .value("Date", $0.date),
                      y: .value("Irradiance", $0.irradiance))
            .foregroundStyle(Color.accentColor)
        }
        .frame(height: 275)
    }
}

struct IrradianceChartView_Previews: PreviewProvider {
    static var previews: some View {
        let reports = Array(MockData.getMockWeatherData()[0..<90])
        IrradianceChartView(reports: reports)
    }
}

extension IrradianceChartView {
    private func getChartData(from reports: [WeatherReport]) -> [MarsIrradianceData] {
        var chartData = [MarsIrradianceData]()
        reports.forEach { report in
            guard let date = report.terrestrialDate.toDate() else { return }
            let irradiance = report.localUvIrradianceIndex.formatUVIndexString()
            let irradianceData = MarsIrradianceData(date: date, irradiance: irradiance)
            chartData.append(irradianceData)
        }
        return chartData
    }
}
