//
//  UIDevice+Ext.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-16.
//

import UIKit

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
