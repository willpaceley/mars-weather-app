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
                    TemperatureChartView(temperatureData: vm.chartData)
                case .daylight:
                    SunlightChartView(vm: SunlightChartViewModel(reports: vm.selectedReports,
                                                                 isShowingSunrise: $vm.isShowingSunrise,
                                                                 isShowingSunset: $vm.isShowingSunset))
                case .conditions:
                    ConditionsChartView(vm: ConditionsChartViewModel(reports: vm.selectedReports))
                case .pressure:
                    PressureChartView(vm: PressureChartViewModel(reports: vm.selectedReports))
                case .irradiance:
                    IrradianceChartView(vm: IrradianceChartViewModel(reports: vm.selectedReports))
                }
                
                if vm.chartType == .temperature {
                    Toggle("Air Temperature", isOn: $vm.isShowingAirTemp)
                        .foregroundColor(.secondary)
                        .disabled(!vm.isShowingGroundTemp)
                    
                    Toggle("Ground Temperature", isOn: $vm.isShowingGroundTemp)
                        .foregroundColor(.secondary)
                        .disabled(!vm.isShowingAirTemp)
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
