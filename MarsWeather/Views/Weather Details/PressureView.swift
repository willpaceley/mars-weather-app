//
//  PressureView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-08.
//

import SwiftUI

struct PressureView: View {
    let sol: Sol
    
    var icon: String {
        switch sol.pressureString {
        case "Higher":
            return "gauge.high"
        case "Lower":
            return "gauge.low"
        default:
            return "gauge.medium"
        }
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Pressure")
                .fontWeight(.semibold)
            
            WeatherIconView(systemName: icon)
            
            Text(sol.pressure + " Pa")
        }
        .padding()
        .frame(width: 110, height: 120)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct PressureView_Previews: PreviewProvider {
    static var previews: some View {
        PressureView(sol: MockData.sol)
    }
}
