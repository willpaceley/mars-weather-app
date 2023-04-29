//
//  LoadingView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-28.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .tint(.accentColor)
            .scaleEffect(1.75)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
