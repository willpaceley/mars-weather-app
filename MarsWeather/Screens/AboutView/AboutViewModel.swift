//
//  AboutViewModel.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-18.
//

import SwiftUI
import AVKit

@MainActor
final class AboutViewModel: ObservableObject {
    @Published var player = AVPlayer(
        url: Bundle.main.url(forResource: "MSL_REMS", withExtension: ".mp4")!
    )
    @Published var isPlaying = false
    
    let isShowingInfo: Binding<Bool>
    
    let REMS_INFO = """
     The information contained in this application is provided by Centro de Astrobiologia (CAB). Mars Weather is for educational purposes only.
     
     The environmental magnitudes in this application are obtained by the Rover Environmental Monitoring Station (REMS) onboard the Mars Science Laboratory (MSL) rover on Mars. The data provided represents the environmental magnitudes at REMS' location, so the MSL rover itself influences those magnitudes (e.g. rover position, rover temperature, rover orientation, rover shade, dust deposits on the rover, etc.)
     
     REMS does not take measurements continuously and it takes measurements at different times from one day to another. This fact also influences the variation of the values provided in the application from one day to another.
     
     For different reasons (instrument maintenance, instrument calibration, instrument degradation, etc.), some or all of the magnitudes in this application may not be available.
     """
    
    init(isShowingInfo: Binding<Bool>) {
        self.isShowingInfo = isShowingInfo
    }
}
