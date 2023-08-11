//
//  HeaderView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-08-11.
//

import SwiftUI

struct HeaderView: View {
    @Binding var isShowingInfo: Bool
    
    var body: some View {
        HStack {
            AppTitleView()
            
            Spacer()
            
            BarButtonIconView(isShowingInfo: $isShowingInfo, icon: "info.circle")
        }
    }
}

#Preview {
    HeaderView(isShowingInfo: .constant(false))
}
