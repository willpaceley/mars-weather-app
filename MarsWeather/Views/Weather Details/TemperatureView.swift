//
//  TemperatureView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-01.
//

import SwiftUI

struct TemperatureView: View {
    let sol: Sol
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(spacing: 7) {
                Text("High")
                    .fontWeight(.semibold)
                
                WeatherIconView(systemName: "thermometer.high")
                
                Text("\(sol.maxTemp) °C")
            }
            
            Spacer()
            
            VStack(spacing: 7) {
                Text("Low")
                    .fontWeight(.semibold)
                
                WeatherIconView(systemName: "thermometer.low")
                
                Text("\(sol.minTemp) °C")
            }
        }
        .padding()
        .frame(minWidth: 150, maxWidth: 175)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(sol: MockData.sol)
    }
}
