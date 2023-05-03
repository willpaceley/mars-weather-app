//
//  AlertContext.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-03.
//

import SwiftUI

struct AlertContext {
    static let defaultAlert = Alert(title: Text("Application Error"),
                                    message: Text("Whoops! An error has occurred."))
    
    static let invalidURL = Alert(title: Text("Network Error"),
                                  message: Text("The URL was invalid or not constructed properly."))
    
    static let invalidResponse = Alert(title: Text("Network Error"),
                                       message: Text("The network call to the weather API provided an invalid response."))
    
    static let invalidData = Alert(title: Text("Network Error"),
                                   message: Text("The data returned from the API was invalid."))
    
    static let unableToComplete = Alert(title: Text("Network Error"),
                                        message: Text("Unable to complete your request. Please check your internet connection."))
}
