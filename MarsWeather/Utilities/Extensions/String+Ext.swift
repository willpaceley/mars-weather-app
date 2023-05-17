//
//  String+Ext.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-05.
//

import Foundation

extension String {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: self) else {
            dateFormatter.dateFormat = "MMMM d, yyyy"
            return dateFormatter.string(from: Date())
        }
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
}
