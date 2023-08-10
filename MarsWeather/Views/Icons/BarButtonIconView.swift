//
//  BarButtonIconView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-08-10.
//

import SwiftUI

struct BarButtonIconView: View {
    @Binding var isShowingInfo: Bool
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.title)
            .foregroundStyle(.secondary)
            .onTapGesture {
                isShowingInfo = true
            }
    }
}

#Preview {
    BarButtonIconView(isShowingInfo: .constant(false), icon: "info.circle")
}
