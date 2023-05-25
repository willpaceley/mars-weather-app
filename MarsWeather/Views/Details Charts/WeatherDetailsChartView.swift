//
//  WeatherDetailsChartView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-22.
//

import SwiftUI

struct WeatherDetailsChartView: View {
    
    let weatherDetail: WeatherDetail
    @Binding var isShowingDetailChart: Bool
    
    private var icon: String {
        switch weatherDetail {
        case .temperature:
            return "thermometer.medium"
        case .sunlight:
            return "sun.and.horizon.fill"
        case .conditions:
            return "cloud.sun.fill"
        case .pressure:
            return "gauge.medium"
        case .irradiance:
            return "sun.max.fill"
        }
    }
    
    var body: some View {
        VStack {
            Label(weatherDetail.rawValue.capitalized, systemImage: icon)
                .bold()
                .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetailChart = false
            } label: {
                DismissButton()
            }
        }
    }
}

struct WeatherDetailsChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsChartView(weatherDetail: .temperature,
                                isShowingDetailChart: .constant(true))
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
