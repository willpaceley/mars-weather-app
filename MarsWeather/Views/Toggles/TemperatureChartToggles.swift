//
//  TemperatureChartToggles.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-29.
//

import SwiftUI

struct TemperatureChartToggles: View {
    @Binding var isShowingAirTemp: Bool
    @Binding var isShowingGroundTemp: Bool
    
    var body: some View {
        Toggle("Air Temperature", isOn: $isShowingAirTemp)
            .foregroundColor(.secondary)
            .tint(.green)
            .disabled(!isShowingGroundTemp)
        
        Toggle("Ground Temperature", isOn: $isShowingGroundTemp)
            .foregroundColor(.secondary)
            .tint(.green)
            .disabled(!isShowingAirTemp)
    }
}

#Preview {
    TemperatureChartToggles(isShowingAirTemp: .constant(true),
                           isShowingGroundTemp: .constant(false))
}
