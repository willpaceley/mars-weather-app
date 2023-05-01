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
                    
                    Text("Latest Report")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading) {
                        Text("Sol " + latestReports[0].sol)
                            .foregroundColor(.accentColor)
                        
                        Text("April 29, 2023")
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .italic()
                    }
                    
                    
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(Color(UIColor.darkGray))
                            .cornerRadius(10)
                            .opacity(0.5)
                        
                        VStack(alignment: .leading,spacing: 0) {
//                            HStack {
//                                Text("Sol " + latestReports[0].sol)
//                            }
//                            .padding(.leading)
//                            .padding(.top, 10)
//                            .foregroundColor(.accentColor)
//                            .fontWeight(.semibold)
//                            .font(.title3)
                            
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
