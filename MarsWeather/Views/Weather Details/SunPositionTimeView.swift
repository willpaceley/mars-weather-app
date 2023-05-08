//
//  SunPositionTimeView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-30.
//

import SwiftUI

struct SunPositionTimeView: View {
    let sol: Sol
    
    var body: some View {
        HStack {
            VStack(spacing: 7) {
                Text("Sunrise")
                    .fontWeight(.semibold)
                
                WeatherIconView(systemName: "sunrise.fill")
                
                Text(sol.sunrise)
                    .font(.callout)
            }
            
            Spacer()
            
            VStack(spacing: 7) {
                Text("Sunset")
                    .fontWeight(.semibold)
                
                WeatherIconView(systemName: "sunset.fill")
                
                Text(sol.sunset)
                    .font(.callout)
            }
        }
        .padding()
//        .frame(minWidth: 150, maxWidth: 200, minHeight: 120)
        .frame(maxWidth: 200, minHeight: 120)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct SunPositionTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SunPositionTimeView(sol: MockData.sol)
    }
}
