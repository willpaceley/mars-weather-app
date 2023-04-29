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
                    
                    Text("April 29, 2023")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .foregroundColor(Color(UIColor.darkGray))
                            .cornerRadius(15)
                            .opacity(0.5)
                        
                        HStack {
                            Text("Sol " + latestReports[0].sol)
                        }
                        .padding(.leading)
                        .padding(.top)
                        .foregroundColor(.accentColor)
                        .fontWeight(.semibold)
                        .font(.title3)
                    }
                    .frame(width: .infinity, height: 225)
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
