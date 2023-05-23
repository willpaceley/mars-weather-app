//
//  WeatherDetailsView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-12.
//

import SwiftUI

struct WeatherDetailsView: View {
    @ObservedObject var vm: WeatherDetailsViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                TemperatureView(report: vm.selectedReport)
                    .onTapGesture { vm.showChart(for: .temperature) }
                
                SunPositionTimeView(report: vm.selectedReport)
                    .onTapGesture { vm.showChart(for: .sunlight) }
            }

            HStack(spacing: 8) {
                ConditionsView(atmoOpacity: vm.selectedReport.atmoOpacity)
                    .onTapGesture { vm.showChart(for: .conditions) }
                
                PressureView(report: vm.selectedReport)
                    .onTapGesture { vm.showChart(for: .pressure) }
                
                UVIrradianceView(irradianceIndex: vm.selectedReport.localUvIrradianceIndex)
                    .onTapGesture { vm.showChart(for: .irradiance) }
            }
        }
        .sheet(isPresented: $vm.isShowingChartSheet) {
            if let weatherDetail = vm.selectedWeatherDetail {
                WeatherDetailsChartView(weatherDetail: weatherDetail)
            }
        }
    }
}

struct WeatherDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(vm: WeatherDetailsViewModel(selectedReport: MockData.report,
                                                       reports: MockData.getMockWeatherData()))
    }
}
