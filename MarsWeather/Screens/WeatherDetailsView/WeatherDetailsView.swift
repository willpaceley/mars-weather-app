//
//  WeatherDetailsView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-22.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    @StateObject var vm: WeatherDetailsViewModel
    @Binding var isShowingChart: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Label(vm.chartType.rawValue.capitalized, systemImage: vm.icon)
                    .bold()
                
                Picker("Time Range", selection: $vm.selectedTimeRange) {
                    Text("3 Month").tag(TimeRange.threeMonth)
                    Text("6 Month").tag(TimeRange.sixMonth)
                    Text("Year").tag(TimeRange.year)
                    Text("2 Year").tag(TimeRange.twoYear)
                    Text("ALL").tag(TimeRange.all)
                }
                .pickerStyle(.segmented)
                
                DetailsChartView(vm: vm)
                
                Text(vm.description)
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(10)
            }
        }
        .padding(.top)
        .padding(.leading)
        .padding(.trailing)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingChart = false
            } label: {
                DismissButtonView()
            }
        }
    }
}

struct WeatherDetailsChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(
            vm: WeatherDetailsViewModel(
                weatherDetail: .daylight,
                reports: MockData.getMockWeatherData()
            ),
            isShowingChart: .constant(true)
        )
    }
}
