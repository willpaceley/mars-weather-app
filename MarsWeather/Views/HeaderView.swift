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
            Text("Mars Weather")
              .marsTitle()
            
            Spacer()
            
            BarButtonIconView(isShowingInfo: $isShowingInfo, icon: "info.circle")
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(isShowingInfo: .constant(false))
    }
}
