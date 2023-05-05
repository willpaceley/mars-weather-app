//
//  LatestReportTitleView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-01.
//

import SwiftUI

struct LatestReportTitleView: View {
    let sol: Sol
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2.5) {
            Text("Latest Report")
                .font(.title2)
                .fontWeight(.semibold)
            
            
            HStack(spacing: 10) {
                Text("Sol " + sol.sol)
                    .foregroundColor(.accentColor)
                
                Divider()
                
                Text(sol.terrestrialDate.formattedDate())
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxHeight: 50)
    }
}

struct LatestReportTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LatestReportTitleView(sol: MockData.sol)
    }
}
