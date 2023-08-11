//
//  MarsWeatherHomeView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-16.
//

import SwiftUI

struct MarsWeatherHomeView: View {
    @StateObject var vm = MarsWeatherViewModel(dataProvider: NASADataProvider())

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if !vm.reports.isEmpty {
                    HeaderView(isShowingInfo: $vm.isShowingInfo)
                    
                    WeatherReportView(vm: vm)
                    
                    Divider()
                        .padding(.top)
                        .padding(.bottom)
                    
                    WeatherReportListView(vm: vm)
                } else if vm.isLoading {
                    LoadingView()
                } else {
                    NoDataView(getWeatherData: vm.getWeatherData)
                }
            }
        }
        .preferredColorScheme(.dark)
        .task {
            await vm.getWeatherData()
        }
        .alert(isPresented: $vm.isPresentingAlert) { vm.alert }
        .sheet(isPresented: $vm.isShowingInfo) {
            AboutView(vm: AboutViewModel(isShowingInfo: $vm.isShowingInfo))
        }
    }
}

struct MarsWeatherHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MarsWeatherHomeView()
    }
}
