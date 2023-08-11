//
//  NoDataView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-08-11.
//

import SwiftUI

struct NoDataView: View {
    let getWeatherData: (Bool) async -> ()
    
    var body: some View {
        VStack {
            Image(systemName: "thermometer.medium.slash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75, height: 75)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.accentColor)
            
            Text("No Weather Data")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("Please check your internet connection.")
                .foregroundStyle(.secondary)
            
            Button {
                Task {
                    await getWeatherData(true)
                }
            } label: {
                Label("Try Again", systemImage: "arrow.clockwise")
            }
            .buttonStyle(.bordered)
            .padding(.top)
        }
    }
}
