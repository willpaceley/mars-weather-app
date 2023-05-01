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
        HStack {
            HStack(spacing: 15) {
                VStack(spacing: 7) {
                    Text("High")
                        .fontWeight(.semibold)
                    
                    Image(systemName: "thermometer.high")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.accentColor)
                    
                    Text("\(sol.maxTemp) °C")
                }
                
                VStack(spacing: 7) {
                    Text("Low")
                        .fontWeight(.semibold)
                    
                    Image(systemName: "thermometer.low")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.accentColor)
                    
                    Text("\(sol.minTemp) °C")
                }
            }
            .padding()
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(sol: MockData.sol)
    }
}
