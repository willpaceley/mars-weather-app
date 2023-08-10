//
//  UVIrradianceView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-05.
//

import SwiftUI

struct UVIrradianceView: View {
    let irradianceIndex: UVIrradianceIndex
    
    var sliderOffset: Double {
        switch irradianceIndex {
        case .empty, .low:
            return -45
        case .moderate:
            return 0
        case .high:
            return 20
        case .veryHigh:
            return 45
        }
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 22.5) {
                Text("Irradiance")
                    .fontWeight(.semibold)
                
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(colors: [.yellow, .orange, .red], startPoint: .leading, endPoint: .trailing))
                        .frame(height: 10)
                        .cornerRadius(5)
                        .frame(width: 100)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 15, height: 15)
                        .offset(CGSize(width: sliderOffset, height: 0))
                }
                
                Text(irradianceIndex == .veryHigh ? "Very High" : irradianceIndex.rawValue)
            }
            
            Spacer()
        }
        .frame(height: 120)
        .background(Color.gray.opacity(0.25))
        .cornerRadius(5)
    }
}

struct UVIrradianceView_Previews: PreviewProvider {
    static var previews: some View {
        UVIrradianceView(irradianceIndex: MockData.report.localUvIrradianceIndex)
//        UVIrradianceView(irradianceIndex: .low)
    }
}
