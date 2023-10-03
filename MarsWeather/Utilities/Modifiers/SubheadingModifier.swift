//
//  SubheadingModifier.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-10-03.
//

import SwiftUI

struct Subheading: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.semibold)
    }
}

extension View {
    func subheading() -> some View {
        modifier(Subheading())
    }
}
