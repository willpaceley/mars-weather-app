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
    
    static let invalidData = Alert(title: Text("Network Error"),
                                   message: Text("The data returned from the API was invalid."))
    
    static let unableToComplete = Alert(title: Text("Network Error"),
                                        message: Text("Unable to complete your request. Please check your internet connection."))
    
    static func invalidResponse(for statusCode: Int) -> Alert {
        let statusCodeMessage = HTTPURLResponse.localizedString(forStatusCode: statusCode)
        let title = "\(statusCode) \(statusCodeMessage.capitalized)"
        let message = "Invalid response from server. Please try again later."
        return Alert(title: Text(title), message: Text(message))
    }
}
