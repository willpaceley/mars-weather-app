//
//  TemperatureVisualizationView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-13.
//

import SwiftUI

struct TemperatureVisualizationView: View {
    let totalWidth: Double = 175
    let report: Report
    let minTemp: Int
    let maxTemp: Int
    
    // calculate "size" of each degree
    var widthPerTemp: Double {
        return totalWidth / Double(maxTemp - minTemp)
    }
    // calculate width of report temp range
    var reportRangeWidth: Double {
        if let maxTemp = Double(report.maxTemp),
           let minTemp = Double(report.minTemp) {
            return widthPerTemp * (maxTemp - minTemp)
        }
        return 0
    }
    
    // CALCULATE OFFSET
    // determine white space (totalWidth - reportRangeWidth)
    // white space / 2 is the available space on left or right
    // determine which way it needs to shift?
    // determine alignment strategy
    // middle section of reportRangeWidth needs to match corresponding temp?
    
    var offset: CGFloat {
        if let maxReportTemp = Double(report.maxTemp),
           let minReportTemp = Double(report.minTemp) {
            let medianReportTemp = (maxReportTemp + minReportTemp) / 2
            print("medianReportTemp: \(medianReportTemp)")
            
            // calculate median total temp, which is x pos 0
            let medianTotalTemp = Double((maxTemp + minTemp) / 2)
            print("medianTotalTemp: \(medianTotalTemp)")
            
            // determine x distance between both medians to calculate offset
            let medianTempDifference = medianTotalTemp - medianReportTemp
            print("medianTempDifference: \(medianTempDifference)")
            
            let tempRange = Double(maxTemp - minTemp)
            let tempToPtsConversion = totalWidth / tempRange
            var calculatedOffset = medianTempDifference * tempToPtsConversion
            print("calculatedOffset: \(calculatedOffset)")
            if medianReportTemp < medianTotalTemp { calculatedOffset *= -1 }
            print("calculatedOffset: \(calculatedOffset)")
            return calculatedOffset
        }
        
        return CGFloat(0)
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
    }
}

struct TemperatureVisualizationView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureVisualizationView(report: MockData.report,
                                     minTemp: -100,
                                     maxTemp: 0)
    }
}
