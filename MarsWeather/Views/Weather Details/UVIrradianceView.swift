//
//  UVIrradianceView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-05.
//

import SwiftUI

struct UVIrradianceView: View {
    let irradianceIndex: LocalUvIrradianceIndex
    
    var sliderOffset: Double {
        switch irradianceIndex {
        case .empty, .low:
            return -87.5
        case .moderate:
            return 43.75
        case .high:
            return 87.5
        case .veryHigh:
            return 175
        }
    }
    
    var body: some View {
        VStack {
            Text("UV Irradiance")
                .fontWeight(.semibold)
            
            ZStack {
                Rectangle()
                    .fill(LinearGradient(colors: [.red, .green, .blue], startPoint: .leading, endPoint: .trailing))
                    .frame(height: 10)
                    .cornerRadius(5)
                    .frame(width: 175)
                
                Circle()
                    .fill(.white)
                    .frame(width: 10, height: 10)
                    .offset(CGSize(width: sliderOffset, height: 0))
            }
            
            Text(irradianceIndex == .veryHigh ? "Very High" : irradianceIndex.rawValue)
        }
        .padding()
        .frame(minWidth: 200)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct UVIrradianceView_Previews: PreviewProvider {
    static var previews: some View {
        UVIrradianceView(irradianceIndex: MockData.sol.localUvIrradianceIndex)
    }
}
