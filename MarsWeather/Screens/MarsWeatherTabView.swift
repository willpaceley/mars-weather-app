//
//  MarsWeatherTabView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import SwiftUI

struct MarsWeatherTabView: View {
    @State private var weatherData: MarsWeatherData?
    @State private var isLoading = false
    
    var body: some View {
        TabView {
            LatestWeatherView(isLoading: $isLoading)
                .tabItem {
                    Label("Latest", systemImage: "thermometer.sun")
                }
            
            TrendsWeatherView(isLoading: $isLoading)
                .tabItem {
                    Label("Trends", systemImage: "chart.xyaxis.line")
                }
            
            InfoScreenView()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
        }
        .preferredColorScheme(.dark)
        .task {
            fetchWeatherData()
        }
    }
}

struct MarsWeatherTabView_Previews: PreviewProvider {
    static var previews: some View {
        MarsWeatherTabView()
    }
}

extension MarsWeatherTabView {
    func fetchWeatherData() {
        isLoading = true
        
        Task {
            do {
                let url = URL(string: "https://mars.nasa.gov/rss/api/?feed=weather&category=msl&feedtype=json")!
                let (data, _) = try await URLSession.shared.data(from: url)
                weatherData = try JSONDecoder().decode(MarsWeatherData.self, from: data)
                
                if let weatherData {
                    print("Fetched weather data for \(weatherData.soles.count) sols!")
                }
                
                isLoading = false
            } catch {
                print("A problem occurred fetching data from the Mars Weather API.")
                isLoading = false
            }
        }
    }
}
