//
//  MarsDateView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-01.
//

import SwiftUI

struct MarsDateView: View {
    let sol: Sol
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2.5) {
            HStack(spacing: 10) {
                Text("Sol " + sol.sol)
                    .foregroundColor(.accentColor)
                
                Divider()
                
                Text(sol.terrestrialDate.formattedDate())
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct LatestReportTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MarsDateView(sol: MockData.sol)
    }
}
