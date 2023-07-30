//
//  Int+Ext.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-29.
//

import Foundation

extension Int {
    func formatMinutesToString() -> String {
        let hours = self / 60
        let minutes = self % 60
        
        if hours < 1 {
            return "\(minutes) Minutes"
        } else if minutes == 0 {
            return "\(hours) Hours"
        }
        
        return "\(hours) Hours \(minutes) Minutes"
    }
}
