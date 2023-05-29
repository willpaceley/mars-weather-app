//
//  WeatherReportView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-12.
//

import SwiftUI

struct WeatherReportView: View {
    @ObservedObject var vm: WeatherReportViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                TemperatureView(report: vm.selectedReport)
                    .onTapGesture { vm.showChart(for: .temperature) }
                
                DaylightView(report: vm.selectedReport)
                    .onTapGesture { vm.showChart(for: .daylight) }
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
        .sheet(isPresented: $vm.isShowingDetailsChart) {
            if let weatherDetail = vm.selectedWeatherDetail {
                DetailsChartView(vm: DetailsChartViewModel(weatherDetail: weatherDetail,
                                                           reports: vm.reports),
                                 isShowingChart: $vm.isShowingDetailsChart)
            }
        }
    }
}

struct WeatherDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherReportView(vm: WeatherReportViewModel(selectedReport: MockData.report,
                                                       reports: MockData.getMockWeatherData()))
    }
}
