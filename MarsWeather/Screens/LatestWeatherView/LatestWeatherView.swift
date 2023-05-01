//
//  LatestWeatherView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-27.
//

import SwiftUI

struct LatestWeatherView: View {
    @Binding var sols: [Sol]?
    
    var body: some View {
        ScrollView {
            if let latestReports = sols {
                VStack(alignment: .leading) {
                    AppTitleView()
                    
                    LatestReportTitleView(sol: latestReports[0])
                    
                    Grid {
                        GridRow {
                            TemperatureView(sol: latestReports[0])
                            SunPositionTimeView(sol: latestReports[0])
                        }
                        
                        Divider()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            Spacer()
        }
        .padding()
    }
}


struct LatestWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        LatestWeatherView(sols: .constant(MockData.sols))
    }
}
