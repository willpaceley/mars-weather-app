//
//  ReportListCellView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-12.
//

import SwiftUI

struct ReportListCellView: View {
    let report: Report
    let lowestTemp: Int
    let highestTemp: Int
    let isSelected: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Sol \(report.sol)")
                    .foregroundColor(Color.accentColor)
                
                Text(report.terrestrialDate.formattedDate())
                    .foregroundColor(Color.secondary)
                    .font(Font.subheadline)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Text("\(report.minTemp)°")
                
                TemperatureVisualizationView(report: report,
                                             lowestTemp: lowestTemp,
                                             highestTemp: highestTemp)
                
                Text("\(report.maxTemp)°")
            }
        }
        .padding(10)
        .background(isSelected ? Color.gray.opacity(0.5) : Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct ReportListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ReportListCellView(report: MockData.report,
                           lowestTemp: -80,
                           highestTemp: -18,
                           isSelected: true)
    }
}
