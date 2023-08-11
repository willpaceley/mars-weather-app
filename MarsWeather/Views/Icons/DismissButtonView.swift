//
//  DismissButtonView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-29.
//

import SwiftUI

struct DismissButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
                .opacity(0.25)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.secondary)
        }
    }
}

struct DismissButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DismissButtonView()
    }
}
