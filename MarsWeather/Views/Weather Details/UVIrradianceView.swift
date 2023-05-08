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
            return -70
        case .moderate:
            return 0
        case .high:
            return 35
        case .veryHigh:
            return 70
        }
    }
    
    var body: some View {
        VStack(spacing: 7) {
            Text("UV Irradiance")
                .fontWeight(.semibold)
            
            ZStack {
                Rectangle()
                    .fill(LinearGradient(colors: [.yellow, .orange, .red], startPoint: .leading, endPoint: .trailing))
                    .frame(height: 10)
                    .cornerRadius(5)
                    .frame(width: 150)
                
                Circle()
                    .fill(.white)
                    .frame(width: 15, height: 15)
                    .offset(CGSize(width: sliderOffset, height: 0))
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            
            Text(irradianceIndex == .veryHigh ? "Very High" : irradianceIndex.rawValue)
        }
        .padding()
//        .frame(minWidth: 175, maxWidth: 250, minHeight: 120)
        .frame(minHeight: 120)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct UVIrradianceView_Previews: PreviewProvider {
    static var previews: some View {
//        UVIrradianceView(irradianceIndex: MockData.sol.localUvIrradianceIndex)
        UVIrradianceView(irradianceIndex: .veryHigh)
    }
}
