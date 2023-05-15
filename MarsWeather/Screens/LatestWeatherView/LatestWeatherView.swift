//
//  LatestWeatherView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-27.
//

import SwiftUI

struct LatestWeatherView: View {
    let reports: [Report]
    var recentReports: [Report] {
        let count = reports.count
        let range = count > 9 ? 0..<9 : 0..<count
        return Array(reports[range])
    }
    var lowestTemp: Int {
        let lowestReport = recentReports.min { a, b in
            return Int(a.minTemp) ?? 0 < Int(b.minTemp) ?? 0
        }
        if let lowestReport {
            let lowest = Int(lowestReport.minTemp) ?? 0
            print("Lowest Temp: \(lowest)")
            return lowest
        }
        return 0
    }
    var highestTemp: Int {
        let highestReport = recentReports.max { a, b in
            return Int(a.maxTemp) ?? 0 < Int(b.maxTemp) ?? 0
        }
        if let highestReport {
            let highest = Int(highestReport.maxTemp) ?? 0
            print("Highest Temp: \(highest)")
            return highest
        }
        return 0
    }
    
    var body: some View {
        ScrollView {
            AppTitleView()
            
            if !reports.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    SubHeaderView(title: "Latest Report")
            
                    MarsDateView(report: reports[0])
                    
                    WeatherDetailsView(report: reports[0])
                    
                    Divider()
                        .padding(.top)
                    
                    SubHeaderView(title: "Last 10 Days")
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    
                    VStack(spacing: 10) {
                        ForEach(recentReports) { report in
                            ReportListCellView(report: report,
                                               lowestTemp: lowestTemp,
                                               highestTemp: highestTemp)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }
}


struct LatestWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        LatestWeatherView(reports: MockData.getMockWeatherData())
    }
}
