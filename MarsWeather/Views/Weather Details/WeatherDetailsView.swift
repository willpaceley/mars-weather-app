//
//  WeatherDetailsView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-12.
//

import SwiftUI

struct WeatherDetailsView: View {
    let sol: Sol
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                TemperatureView(sol: sol)
                SunPositionTimeView(sol: sol)
            }

            HStack {
                ConditionsView(atmoOpacity: sol.atmoOpacity)
                PressureView(sol: sol)
                UVIrradianceView(irradianceIndex: sol.localUvIrradianceIndex)
            }
        }
    }
}

struct WeatherDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(sol: MockData.sol)
    }
}
