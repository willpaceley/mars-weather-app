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
            VStack(spacing: 0) {
                if !vm.reports.isEmpty {
                    HStack {
                        AppTitleView()
                        
                        Spacer()
                        
                        Image(systemName: "info.circle")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                            .onTapGesture {
                                vm.isShowingInfo = true
                            }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
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
        .sheet(isPresented: $vm.isShowingInfo) {
            AttributionView(isShowingInfo: $vm.isShowingInfo)
        }
    }
}

struct MarsWeatherHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MarsWeatherHomeView()
    }
}
