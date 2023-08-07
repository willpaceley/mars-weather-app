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
    
    static func invalidResponse(for statusCode: Int) -> Alert {
        let statusCodeMessage = HTTPURLResponse.localizedString(forStatusCode: statusCode)
        let title = "\(statusCode) \(statusCodeMessage.capitalized)"
        let message = "Invalid response from server. Please try again later."
        return Alert(title: Text(title), message: Text(message))
    }
    
    static func decodingError(_ error: Error) -> Alert {
        let message: String
        
        if let decodingError = error as? DecodingError {
            switch decodingError {
            case .typeMismatch(let type, _):
                message = "The given type, \(type), could not be decoded because it did not match the type of what was found in the encoded payload."
            case .valueNotFound(let type, _):
                message = "A non-optional value of \(type) was expected, but a null value was found."
            case .keyNotFound(let codingKey, _):
                message = "A keyed decoding container was asked for an entry for the given key \(codingKey.stringValue), but did not contain one."
            case .dataCorrupted(_):
                message = "The data is corrupted or otherwise invalid."
            @unknown default:
                message = "An error occurred decoding the JSON data."
            }

            return Alert(title: Text("Decoding Error"), message: Text(message))
        } else {
            return AlertContext.genericError(error)
        }
    }
    
    static func cacheError(_ error: Error) -> Alert {
        return Alert(title: Text("Cache Error"), message: Text(error.localizedDescription))
    }
    
    static func genericError(_ error: Error) -> Alert {
        return Alert(title: Text("Application Error"), message: Text(error.localizedDescription))
    }
}
