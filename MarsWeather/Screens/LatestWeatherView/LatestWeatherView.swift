//
//  LatestWeatherView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-27.
//

import SwiftUI

struct LatestWeatherView: View {
    let sols: [Sol]
    
    var body: some View {
        ScrollView {
            if !sols.isEmpty {
                VStack(alignment: .leading) {
                    AppTitleView()
                    
                    LatestReportTitleView(sol: sols[0])
                                        
                    VStack(alignment: .center) {
                        HStack {
                            TemperatureView(sol: sols[0])
                            SunPositionTimeView(sol: sols[0])
                        }

                        HStack {
                            ConditionsView(atmoOpacity: sols[0].atmoOpacity)
                            PressureView(sol: sols[0])
                            UVIrradianceView(irradianceIndex: sols[0].localUvIrradianceIndex)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            Spacer()
        }
        .navigationTitle("Mars Weather")
        .padding()
    }
}


struct LatestWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        LatestWeatherView(sols: MockData.sols)
    }
}
