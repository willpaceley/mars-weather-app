//
//  AboutView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-16.
//

import SwiftUI
import AVKit

struct AboutView: View {
    @State private var player = AVPlayer(
        url: Bundle.main.url(forResource: "MSL_REMS", withExtension: ".mp4")!
    )
    @State private var isPlaying = false
    @Binding var isShowingInfo: Bool
    
    private let REMS_INFO = """
     The information contained in this application is provided by Centro de Astrobiologia (CAB). Mars Weather is for educational purposes only.
     
     The environmental magnitudes in this application are obtained by the Rover Environmental Monitoring Station (REMS) onboard the Mars Science Laboratory (MSL) rover on Mars. The data provided represents the environmental magnitudes at REMS' location, so the MSL rover itself influences those magnitudes (e.g. rover position, rover temperature, rover orientation, rover shade, dust deposits on the rover, etc.)
     
     REMS does not take measurements continuously and it takes measurements at different times from one day to another. This fact also influences the variation of the values provided in the application from one day to another.
     
     For different reasons (instrument maintenance, instrument calibration, instrument degradation, etc.), some or all of the magnitudes in this application may not be available.
     """
    
    var body: some View {
        VStack {
            Label("About", systemImage: "info.circle")
                .bold()
                .padding()

            VideoPlayer(player: player)
                    .frame(height: 200)
            
            Text("The Rover Environmental Monitoring Station (REMS) onboard the Curiosity rover on Mars.")
                .foregroundStyle(.secondary)
                .font(.callout)
                .italic()
                .fontWeight(.light)
                .padding(.bottom)
            
            ScrollView {
                Text(REMS_INFO)
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .onAppear(perform: {
            player.play()
        })
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingInfo = false
            } label: {
                DismissButton()
            }
        }
    }
}

#Preview {
    AboutView(isShowingInfo: .constant(true))
}
