//
//  ConditionsPressureView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-08.
//

import SwiftUI

struct ConditionsPressureView: View {
    let sol: Sol
    
    var body: some View {
        HStack {
            ConditionsView(atmoOpacity: sol.atmoOpacity)
            
            Spacer()
            
            PressureView(sol: sol)
        }
        .padding()
//        .frame(minWidth: 150, maxWidth: 200, minHeight: 120)
        .frame(width: 200, height: 120)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct ConditionsPressureView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsPressureView(sol: MockData.sol)
    }
}
