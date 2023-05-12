//
//  LatestWeatherView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-27.
//

import SwiftUI

struct LatestWeatherView: View {
    let sols: [Sol]
    var recentReports: [Sol] {
        let length = sols.count
        
        if length > 6 {
            return Array(sols[0..<7])
        } else {
            return Array(sols[0..<length])
        }
    }
    
    var body: some View {
        ScrollView {
            AppTitleView()
            
            if !sols.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    SubHeaderView(title: "Latest Report")
            
                    MarsDateView(sol: sols[0])
                        .padding(.bottom, 10)
                    
                    WeatherDetailsView(sol: sols[0])
                    
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
        LatestWeatherView(sols: MockData.sols)
    }
}
