//
//  AboutView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-07-16.
//

import SwiftUI
import AVKit

struct AboutView: View {
    @ObservedObject var vm: AboutViewModel
    
    var body: some View {
        VStack {
            Label("About", systemImage: "info.circle")
                .bold()
                .padding()

            VideoPlayer(player: vm.player)
                    .frame(height: 200)
            
            Text("The Rover Environmental Monitoring Station (REMS) onboard the Curiosity rover on Mars.")
                .foregroundStyle(.secondary)
                .font(.callout)
                .italic()
                .fontWeight(.light)
                .padding(.bottom)
            
            ScrollView {
                Text(vm.REMS_INFO)
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .onAppear(perform: {
            vm.player.play()
        })
        .overlay(alignment: .topTrailing) {
            Button {
                vm.isShowingInfo.wrappedValue = false
            } label: {
                DismissButton()
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(vm: AboutViewModel(isShowingInfo: .constant(true)))
    }
}
