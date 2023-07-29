//
//  ChartData.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-29.
//

import Foundation
import Charts

struct ChartData: Identifiable {
    let id = UUID()
    let xAxis: any Plottable
    let yAxis: any Plottable
    var type: ChartDataType? = nil
}

enum ChartDataType: String {
    case maxAirTemp = "Max Air"
    case minAirTemp = "Min Air"
    case maxGroundTemp = "Max Ground"
    case minGroundTemp = "Min Ground"
    case sunrise = "Sunrise"
    case sunset = "Sunset"
}
