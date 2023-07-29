//
//  DetailsChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-06-06.
//

import SwiftUI

struct DetailsChartView: View {
    @ObservedObject var vm: WeatherDetailsViewModel
    
    var body: some View {
        VStack {
            GroupBox(vm.chartSummaryTitle) {
                HStack {
                    Text(vm.getSummary(for: vm.chartType, from: vm.selectedReports))
                        .bold()
                        .foregroundStyle(.primary)
                    
                    Spacer()
                }
                
                switch vm.chartType {
                case .temperature:
                    TemperatureChartView(
                        reports: vm.selectedReports,
                        isShowingAirTemp: vm.isShowingAirTemp,
                        isShowingGroundTemp: vm.isShowingGroundTemp
                    )
                case .daylight:
                    SunlightChartView(
                        reports: vm.selectedReports,
                        isShowingSunrise: vm.isShowingSunrise,
                        isShowingSunset: vm.isShowingSunset
                    )
                case .conditions:
                    ConditionsChartView(reports: vm.selectedReports)
                case .pressure:
                    PressureChartView(vm: PressureChartViewModel(reports: vm.selectedReports))
                case .irradiance:
                    IrradianceChartView(vm: IrradianceChartViewModel(reports: vm.selectedReports))
                }
                
                if vm.chartType == .temperature {
                    TemperatureChartToggles(
                        isShowingAirTemp: $vm.isShowingAirTemp,
                        isShowingGroundTemp: $vm.isShowingGroundTemp
                    )
                } else if vm.chartType == .daylight {
                    DaylightChartToggles(
                        isShowingSunrise: $vm.isShowingSunrise,
                        isShowingSunset: $vm.isShowingSunset
                    )
                }
            }
            .fontWeight(.regular)
            .foregroundStyle(.secondary)
        }
    }
}

struct DetailsChartView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsChartView(vm: WeatherDetailsViewModel(weatherDetail: .temperature,
                                                     reports: Array(MockData.getMockWeatherData())))
    }
}
