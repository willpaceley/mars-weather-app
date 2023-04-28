//
//  MarsWeatherTabView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import SwiftUI

struct MarsWeatherTabView: View {
    @State private var weatherData: MarsWeatherData?
    
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
        Task {
            do {
                let url = URL(string: "https://mars.nasa.gov/rss/api/?feed=weather&category=msl&feedtype=json")!
                let (data, _) = try await URLSession.shared.data(from: url)
                weatherData = try JSONDecoder().decode(MarsWeatherData.self, from: data)
                if let weatherData {
                    print("Fetched weather data for \(weatherData.soles.count) sols!")
                }
            } catch {
                print("A problem occurred fetching data from the Mars Weather API.")
            }
        }
    }
}
