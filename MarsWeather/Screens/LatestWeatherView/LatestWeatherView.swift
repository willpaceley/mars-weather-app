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
                            ReportListCellView(report: report)
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
