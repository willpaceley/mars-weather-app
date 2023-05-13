//
//  ConditionsPressureView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-08.
//

import SwiftUI

struct ConditionsPressureView: View {
    let report: Report
    
    var body: some View {
        HStack {
            ConditionsView(atmoOpacity: report.atmoOpacity)
            
            Spacer()
            
            PressureView(report: report)
        }
        .padding()
        .frame(width: 200, height: 120)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct ConditionsPressureView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsPressureView(report: MockData.report)
    }
}
