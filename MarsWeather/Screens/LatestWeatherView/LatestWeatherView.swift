//
//  LatestWeatherView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-27.
//

import SwiftUI

struct LatestWeatherView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack {
            if isLoading {
                LoadingView()
            } else {
                Text("Latest Weather")
            }
        }
        .padding()
    }
}

struct LatestWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        LatestWeatherView(isLoading: .constant(false))
    }
}
