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
        VStack {
            Label(vm.weatherDetail.rawValue.capitalized, systemImage: vm.icon)
                .bold()
                .padding()
            
            Picker("Time Range", selection: $vm.selectedTimeCoordinate) {
                Text("Monthly").tag(TimeCoordinate.month)
                Text("Yearly").tag(TimeCoordinate.year)
            }
            .pickerStyle(.segmented)
            .padding()
            
            HStack {
                Spacer()
                
                if vm.selectedTimeCoordinate == .month {
                    Picker("Month", selection: $vm.selectedMonth) {
                        ForEach(MarsMonth.allCases) { month in
                            Text(month.rawValue)
                        }
                    }
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(5)
                }
                
                Picker("Year", selection: $vm.selectedYear) {
                    ForEach(vm.yearRange, id: \.self) { year in
                        Text(String(year))
                    }
                }
                .background(Color.gray.opacity(0.25))
                .cornerRadius(5)
            }
            .padding(.trailing)
            
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
