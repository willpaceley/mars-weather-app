//
//  TrendsWeatherView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import SwiftUI

struct TrendsWeatherView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack {
            if isLoading {
                LoadingView()
            } else {
                Text("Weather Trends")
            }
        }
    }
}

struct TrendsWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsWeatherView(isLoading: .constant(false))
    }
}
