//
//  ConditionsView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-01.
//

import SwiftUI

struct ConditionsView: View {
    let atmoOpacity: String
    
    var icon: String {
        return atmoOpacity == "Sunny" ? "sun.max.fill": "sun.haze"
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 15) {
                Text("Condition")
                    .fontWeight(.semibold)
                
                WeatherIconView(systemName: icon)
                
                Text(atmoOpacity)
            }
            
            Spacer()
        }
        .frame(height: 120)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct ConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsView(atmoOpacity: "Sunny")
    }
}
