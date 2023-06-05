//
//  MarsWeatherHomeView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-16.
//

import SwiftUI

struct MarsWeatherHomeView: View {
    @StateObject var vm = MarsWeatherViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.accentColor.opacity(0.25),
                                    Color.accentColor.opacity(0.05)],
                           startPoint: .bottomTrailing,
                           endPoint: .topLeading)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                if !vm.reports.isEmpty {
                    AppTitleView()
                    
                    LatestWeatherView(vm: LatestWeatherViewModel(reports: vm.reports))
                }
                
                if vm.isLoading {
                    LoadingView()
                }
            }
        }
        .preferredColorScheme(.dark)
        .task {
//            vm.getMockWeatherData()
            vm.getWeatherData()
        }
        .alert(isPresented: $vm.isPresentingAlert) { vm.alert }
    }
}

struct MarsWeatherHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MarsWeatherHomeView()
    }
}
