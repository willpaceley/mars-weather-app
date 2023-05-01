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
                    
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(Color(UIColor.darkGray))
                            .cornerRadius(10)
                            .opacity(0.5)
                        
                        VStack(alignment: .leading,spacing: 0) {
                            SunPositionTimeView(sol: latestReports[0])
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Spacer()
            }
        }
        .padding()
    }
}

struct LatestWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        LatestWeatherView(sols: .constant(MockData.sols))
    }
}
