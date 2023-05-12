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
                LatestWeatherView(sols: vm.sols)
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
            vm.getWeatherData()
        }
        .alert(isPresented: $vm.isPresentingAlert) { vm.alert }
    }
}

struct MarsWeatherTabView_Previews: PreviewProvider {
    static var previews: some View {
        MarsWeatherTabView()
    }
}
