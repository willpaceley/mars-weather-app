//
//  WeatherIconView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-01.
//

import SwiftUI

struct WeatherIconView: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .symbolRenderingMode(.hierarchical)
            .foregroundColor(.accentColor)
    }
}

struct WeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconView(systemName: "thermometer.high")
    }
}
