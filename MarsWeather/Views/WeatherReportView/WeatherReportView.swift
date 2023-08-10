//
//  WeatherReportView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-12.
//

import SwiftUI

struct WeatherReportView: View {
    @ObservedObject var vm: MarsWeatherViewModel
    
    var body: some View {
        VStack {
            if let selectedReport = vm.selectedReport {
                MarsDateView(report: selectedReport)
                
                HStack(spacing: 8) {
                    TemperatureView(report: selectedReport)
                        .onTapGesture { vm.showChart(for: .temperature) }
                    
                    DaylightView(report: selectedReport)
                        .onTapGesture { vm.showChart(for: .daylight) }
                }

                HStack(spacing: 8) {
                    ConditionsView(atmoOpacity: selectedReport.atmoOpacity)
                        .onTapGesture { vm.showChart(for: .conditions) }
                    
                    PressureView(report: selectedReport)
                        .onTapGesture { vm.showChart(for: .pressure) }
                    
                    UVIrradianceView(irradianceIndex: selectedReport.localUvIrradianceIndex)
                        .onTapGesture { vm.showChart(for: .irradiance) }
                }
            }
        }
        .sheet(isPresented: $vm.isShowingDetailsChart) {
            if let weatherDetail = vm.selectedWeatherDetail {
                WeatherDetailsView(
                    vm: WeatherDetailsViewModel(
                        weatherDetail: weatherDetail,
                        reports: vm.reports
                    ),
                    isShowingChart: $vm.isShowingDetailsChart
                )
            }
        }
#if DEBUG
        .task {
            await vm.getWeatherData()
        }
#endif
    }
}

struct WeatherDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherReportView(vm: MarsWeatherViewModel(dataProvider: MockDataProvider()))
    }
}
