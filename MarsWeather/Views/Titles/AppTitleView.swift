//
//  AppTitleView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-29.
//

import SwiftUI

struct AppTitleView: View {
    var body: some View {
        Text("Mars Weather")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(
                LinearGradient(
                    colors: [.orange,
                             .accentColor],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}

struct AppTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AppTitleView()
    }
}
