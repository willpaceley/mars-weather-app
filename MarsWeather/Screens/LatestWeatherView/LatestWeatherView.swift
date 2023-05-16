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
        calculateLowestTemp(from: recentReports)
    }
    var highestTemp: Int {
        calculateHighestTemp(from: recentReports)
    }
    
    var body: some View {
        VStack {
            AppTitleView()
            
            if !reports.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    SubHeaderView(title: "Latest Report")
            
                    MarsDateView(report: reports[0])
                        .padding(.bottom, 5)
                    
                    WeatherDetailsView(report: reports[0])
                    
                    Divider()
                        .padding(.top)
                    
                    SubHeaderView(title: "Last 10 Days")
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(recentReports) { report in
                                ReportListCellView(report: report,
                                                   lowestTemp: lowestTemp,
                                                   highestTemp: highestTemp)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
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

extension LatestWeatherView {
    func calculateLowestTemp(from recentReports: [Report]) -> Int {
        let lowestReport = recentReports.min { a, b in
            return Int(a.minTemp) ?? 0 < Int(b.minTemp) ?? 0
        }
        if let lowestReport {
            return Int(lowestReport.minTemp) ?? 0
        }
        return 0
    }
    
    func calculateHighestTemp(from recentReports: [Report]) -> Int {
        let highestReport = recentReports.max { a, b in
            return Int(a.maxTemp) ?? 0 < Int(b.maxTemp) ?? 0
        }
        if let highestReport {
            return Int(highestReport.maxTemp) ?? 0
        }
        return 0
    }
}
