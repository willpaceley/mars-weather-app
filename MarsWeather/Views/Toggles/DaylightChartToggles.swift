//
//  DaylightChartToggles.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-29.
//

import SwiftUI

struct DaylightChartToggles: View {
    @Binding var isShowingSunrise: Bool
    @Binding var isShowingSunset: Bool
    
    var body: some View {
        Toggle("Sunrise", isOn: $isShowingSunrise)
            .foregroundColor(.secondary)
            .tint(.green)
            .disabled(!isShowingSunset)
        
        Toggle("Sunset", isOn: $isShowingSunset)
            .foregroundColor(.secondary)
            .tint(.green)
            .disabled(!isShowingSunrise)
    }
}

struct DaylightChartToggles_Previews: PreviewProvider {
    static var previews: some View {
        DaylightChartToggles(
            isShowingSunrise: .constant(true),
            isShowingSunset: .constant(false)
        )
    }
}
