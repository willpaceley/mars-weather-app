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
        switch vm.weatherDetail {
        case .temperature:
            TemperatureChartView(vm: TemperatureChartViewModel(reports: vm.selectedReports,
                                                               isShowingAirTemp: $vm.isShowingAirTemp,
                                                               isShowingGroundTemp: $vm.isShowingGroundTemp))
        case .daylight:
            SunlightChartView(vm: SunlightChartViewModel(reports: vm.selectedReports,
                                                         isShowingSunrise: $vm.isShowingSunrise,
                                                         isShowingSunset: $vm.isShowingSunset))
        default:
            TemperatureChartView(vm: TemperatureChartViewModel(reports: vm.selectedReports,
                                                               isShowingAirTemp: $vm.isShowingAirTemp,
                                                               isShowingGroundTemp: $vm.isShowingGroundTemp))
        }
    }
}

struct DetailsChartView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsChartView(vm: WeatherDetailsViewModel(weatherDetail: .temperature,
                                                     reports: Array(MockData.getMockWeatherData()[0..<31])))
    }
}
