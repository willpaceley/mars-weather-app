//
//  LatestWeatherView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-27.
//

import SwiftUI

struct LatestWeatherView: View {
    @ObservedObject var vm: LatestWeatherViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SubHeaderView(title: "Latest Report")
            
            MarsDateView(report: vm.selectedReport)
                .padding(.bottom, 5)
            
            WeatherDetailsView(report: vm.selectedReport)
            
            Divider()
                .padding(.top)
            
            SubHeaderView(title: "Last 10 Days")
                .padding(.top, 10)
                .padding(.bottom, 10)
            
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(vm.recentReports) { report in
                        ReportListCellView(report: report,
                                           lowestTemp: vm.lowestTemp,
                                           highestTemp: vm.highestTemp,
                                           isSelected: report.id == vm.selectedReport.id)
                        .onTapGesture {
                            vm.selectedReport = report
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}


struct LatestWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        LatestWeatherView(vm: LatestWeatherViewModel(reports: MockData.getMockWeatherData()))
    }
}
