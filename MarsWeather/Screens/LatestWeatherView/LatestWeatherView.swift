//
//  LatestWeatherView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-27.
//

import SwiftUI

struct LatestWeatherView: View {
    let sols: [Sol]
    
    var body: some View {
        ScrollView {
            AppTitleView()
            
            if !sols.isEmpty {
                VStack(alignment: .leading, spacing: 0) {
                    SubHeaderView(title: "Latest Report")
            
                    MarsDateView(sol: sols[0])
                        .padding(.bottom, 10)
                    
                    WeatherDetailsView(sol: sols[0])
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
        }
        .padding()
    }
}


struct LatestWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        LatestWeatherView(sols: MockData.sols)
    }
}
