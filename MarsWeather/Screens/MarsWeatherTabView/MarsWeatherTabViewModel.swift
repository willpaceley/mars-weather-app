//
//  MarsWeatherTabViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import Foundation

final class MarsWeatherTabViewModel: ObservableObject {
    @Published var sols: [Sol]?
    @Published var isLoading = false
    
    var descriptions: Descriptions?
}
