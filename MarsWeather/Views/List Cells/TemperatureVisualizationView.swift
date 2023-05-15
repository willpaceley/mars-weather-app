//
//  TemperatureVisualizationView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-13.
//

import SwiftUI

struct TemperatureVisualizationView: View {
    let totalWidth: Double = 125
    let report: Report
    let minTemp: Int
    let maxTemp: Int
    
    var reportRangeWidth: Double {
        calculateRangeWidth(for: report)
    }
    var offset: CGFloat {
        calculateOffset(for: report)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.secondary)
                .frame(height: 5)
                .cornerRadius(5)
                .frame(width: totalWidth)
            
            Rectangle()
                .fill(LinearGradient(colors: [.blue, .yellow, .orange, .red], startPoint: .leading, endPoint: .trailing))
                .frame(height: 5)
                .cornerRadius(5)
                .frame(width: totalWidth)
                .mask {
                    Rectangle()
                        .frame(width: reportRangeWidth, height: 5)
                        .cornerRadius(5)
                        .offset(x: offset, y: 0)
                }
        }
        .frame(width: totalWidth)
    }
}

struct TemperatureVisualizationView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureVisualizationView(report: MockData.report,
                                     minTemp: -90,
                                     maxTemp: -18)
    }
}

extension TemperatureVisualizationView {
    // calculate width for given report's temperature range
    func calculateRangeWidth(for report: Report) -> Double {
        if let maxReportTemp = Double(report.maxTemp),
           let minReportTemp = Double(report.minTemp) {
            let widthPerDegree = totalWidth / Double(maxTemp - minTemp)
            return widthPerDegree * (maxReportTemp - minReportTemp)
        }
        return 0
    }
    
    // calculate offset of report temperature bar
    func calculateOffset(for report: Report) -> CGFloat {
        if let maxReportTemp = Double(report.maxTemp),
           let minReportTemp = Double(report.minTemp) {
            // calculate midrange total temp, which is represented @ x pos 0
            let midrangeTotalTemp = Double((maxTemp + minTemp) / 2)
            
            // determine degree difference between total and report temp midranges
            let midrangeReportTemp = (maxReportTemp + minReportTemp) / 2
            let midrangeDifference = midrangeTotalTemp - midrangeReportTemp
            
            // calculate ratio of degrees of temp to UI pts
            let degreesToPtsRatio = totalWidth / Double(maxTemp - minTemp)
            
            // calculate offset by converting midrange difference to UI pts
            var calculatedOffset = midrangeDifference * degreesToPtsRatio
            
            // determine if the offset needs to shift left or right
            if midrangeReportTemp < midrangeTotalTemp { calculatedOffset *= -1 }
            
            return calculatedOffset
        }
        return CGFloat(0)
    }
}
