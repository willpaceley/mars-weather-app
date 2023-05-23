//
//  SunlightView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-30.
//

import SwiftUI

struct SunlightView: View {
    let report: Report
    
    var body: some View {
        HStack {
            VStack(spacing: 7) {
                Text("Sunrise")
                    .fontWeight(.semibold)
                
                WeatherIconView(systemName: "sunrise.fill")
                
                Text(report.sunrise)
                    .font(.callout)
            }
            
            Spacer()
            
            VStack(spacing: 7) {
                Text("Sunset")
                    .fontWeight(.semibold)
                
                WeatherIconView(systemName: "sunset.fill")
                
                Text(report.sunset)
                    .font(.callout)
            }
        }
        .padding()
        .frame(height: 120)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct SunPositionTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SunlightView(report: MockData.report)
    }
}
