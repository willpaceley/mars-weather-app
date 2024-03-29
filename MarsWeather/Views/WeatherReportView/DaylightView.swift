//
//  DaylightView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-30.
//

import SwiftUI

struct DaylightView: View {
    let report: WeatherReport
    
    var body: some View {
        HStack {
            if UIDevice.isIPad {
                Spacer()
            }
            
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
            
            if UIDevice.isIPad {
                Spacer()
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
        DaylightView(report: MockData.report)
    }
}
