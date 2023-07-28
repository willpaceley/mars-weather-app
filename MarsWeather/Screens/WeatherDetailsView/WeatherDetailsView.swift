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
            Label(vm.weatherDetail.rawValue.capitalized, systemImage: vm.icon)
                .bold()
                .padding()
            
            Picker("Time Range", selection: $vm.selectedTimeRange) {
                Text("3 Month").tag(TimeRange.threeMonth)
                Text("6 Month").tag(TimeRange.sixMonth)
                Text("Year").tag(TimeRange.year)
                Text("2 Year").tag(TimeRange.twoYear)
                Text("ALL").tag(TimeRange.all)
            }
            .pickerStyle(.segmented)
            .padding()
            
            DetailsChartView(vm: vm)
                .padding()
            
            ScrollView {
                Text(vm.description)
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(10)
                    .padding()
            }
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
        WeatherDetailsView(vm: WeatherDetailsViewModel(weatherDetail: .temperature,
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
