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

struct BarButtonIconView_Previews: PreviewProvider {
    static var previews: some View {
        BarButtonIconView(
            isShowingInfo: .constant(false),
            icon: "info.circle"
        )
    }
}
