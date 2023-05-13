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
        let length = reports.count
        
        if length > 6 {
            return Array(reports[0..<7])
        } else {
            return Array(reports[0..<length])
        }
    }
    
    var body: some View {
        ScrollView {
            AppTitleView()
            
            if !reports.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    SubHeaderView(title: "Latest Report")
            
                    MarsDateView(report: reports[0])
                        .padding(.bottom, 10)
                    
                    WeatherDetailsView(report: reports[0])
                    
                    Divider()
                        .padding(.top)
                        .padding(.bottom)
                    
                    SubHeaderView(title: "Last 7 Days")
                    
                    ForEach(recentReports) { report in
                        Text(report.sol)
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
