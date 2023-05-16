//
//  MarsDateView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-05-01.
//

import SwiftUI

struct MarsDateView: View {
    let report: Report
    
    var body: some View {
        HStack {
            HStack(spacing: 10) {
                Text("Sol " + report.sol)
                    .foregroundColor(.accentColor)
                
                Divider()
                
                Text(report.terrestrialDate.formattedDate())
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .frame(height: 25)
    }
}

struct LatestReportTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MarsDateView(report: MockData.report)
    }
}
