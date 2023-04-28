//
//  MarsWeatherTabView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import SwiftUI

struct MarsWeatherTabView: View {
    var body: some View {
        TabView {
            LatestWeatherView()
                .tabItem {
                    Label("Latest", systemImage: "thermometer.sun")
                }
            
            TrendsWeatherView()
                .tabItem {
                    Label("Trends", systemImage: "chart.xyaxis.line")
                }
            
            InfoScreenView()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
        }
    }
}

struct MarsWeatherTabView_Previews: PreviewProvider {
    static var previews: some View {
        MarsWeatherTabView()
    }
}
