//
//  SunPositionTimeView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-30.
//

import SwiftUI

struct SunPositionTimeView: View {
    let sol: Sol
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(spacing: 7) {
                Text("Sunrise")
                    .fontWeight(.semibold)
                
                Image(systemName: "sunrise.fill")
                    .resizable()
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.accentColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                Text(sol.sunrise)
                    .font(.callout)
            }
            
            VStack(spacing: 7) {
                Text("Sunset")
                    .fontWeight(.semibold)
                
                Image(systemName: "sunset.fill")
                    .resizable()
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.accentColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                Text(sol.sunset)
                    .font(.callout)
            }
        }
        .padding()
        .cornerRadius(7)
    }
}

struct SunPositionTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SunPositionTimeView(sol: MockData.sol)
    }
}
