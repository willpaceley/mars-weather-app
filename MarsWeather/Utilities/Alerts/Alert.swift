//
//  Alert.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let Message: Text
}

struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Network Error"),
                                      Message: Text("The URL was invalid or not constructed properly."))
    
    static let invalidResponse = AlertItem(title: Text("Network Error"),
                                      Message: Text("The network call to the weather API provided an invalid response."))
    
    static let invalidData = AlertItem(title: Text("Network Error"),
                                      Message: Text("The data returned from the API was invalid."))
    
    static let unableToComplete = AlertItem(title: Text("Network Error"),
                                      Message: Text("Unable to complete your request. Please check your internet connection."))
}
