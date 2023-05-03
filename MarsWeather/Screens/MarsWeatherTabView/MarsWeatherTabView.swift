//
//  MarsWeatherTabView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import SwiftUI

struct MarsWeatherTabView: View {
    @StateObject var vm = MarsWeatherTabViewModel()
    
    var body: some View {
        ZStack {
            TabView {
                LatestWeatherView(sols: $vm.sols)
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
            
            if vm.isLoading {
                LoadingView()
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
        vm.isLoading = true
        
        Task {
            do {
                let url = URL(string: "https://mars.nasa.gov/rss/api/?feed=weather&category=msl&feedtype=json")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let weatherData = try JSONDecoder().decode(MarsWeatherData.self, from: data)
                
                vm.sols = weatherData.soles
                vm.descriptions = weatherData.descriptions
                
                if let sols = vm.sols {
                    print("Fetched weather data for \(sols.count) sols!")
                }
                
                vm.isLoading = false
            } catch {
                print("A problem occurred fetching data from the Mars Weather API.")
                vm.isLoading = false
            }
        }
    }
}
