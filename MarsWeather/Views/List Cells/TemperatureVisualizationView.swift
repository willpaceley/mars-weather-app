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
    // calculate width of report temp range
    // calculate offset
    
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
                        .frame(width: 100, height: 5)
                        .cornerRadius(5)
                        .offset(x: -50, y: 0)
                }
        }
    }
}

struct TemperatureVisualizationView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureVisualizationView(report: MockData.report,
                                     minTemp: 0,
                                     maxTemp: 10)
    }
}
