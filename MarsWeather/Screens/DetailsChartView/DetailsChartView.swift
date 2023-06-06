//
//  DetailsChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-22.
//

import SwiftUI

struct DetailsChartView: View {
    
    @StateObject var vm: DetailsChartViewModel
    @Binding var isShowingChart: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Label(vm.weatherDetail.rawValue.capitalized, systemImage: vm.icon)
                .bold()
                .padding()
            
            Picker("Time Range", selection: $vm.selectedTimeCoordinate) {
                Text("Month").tag(TimeCoordinate.month)
                Text("6 Month").tag(TimeCoordinate.sixMonth)
                Text("Year").tag(TimeCoordinate.year)
                Text("2 Year").tag(TimeCoordinate.twoYear)
                Text("ALL").tag(TimeCoordinate.all)
            }
            .pickerStyle(.segmented)
            .padding()
            
            TemperatureChartView(reports: vm.selectedReports)
                .padding()
            
            Text(vm.description)
                .padding()
                .background(Color.gray.opacity(0.25))
                .cornerRadius(10)
                .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingChart = false
            } label: {
                DismissButton()
            }
        }
    }
}

struct WeatherDetailsChartView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsChartView(vm: DetailsChartViewModel(weatherDetail: .temperature,
                                                   reports: MockData.getMockWeatherData()),
                         isShowingChart: .constant(true))
    }
}

struct DismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
                .opacity(0.25)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.secondary)
        }
    }
}
