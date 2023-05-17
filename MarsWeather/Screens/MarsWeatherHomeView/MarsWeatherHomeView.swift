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
            VStack(spacing: 5) {
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
            vm.getMockWeatherData()
        }
        .alert(isPresented: $vm.isPresentingAlert) { vm.alert }
    }
}

struct MarsWeatherHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MarsWeatherHomeView()
    }
}
