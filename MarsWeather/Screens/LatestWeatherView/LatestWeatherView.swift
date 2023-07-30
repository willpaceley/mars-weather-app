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
            MarsDateView(report: vm.selectedReport)
                .padding(.bottom, 5)
            
            WeatherReportView(vm: WeatherReportViewModel(selectedReport: vm.selectedReport,                                                  reports: vm.reports))
            
            Divider()
                .padding(.top)
            
            SubHeaderView(title: "Last 30 Days")
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
        .padding(.leading)
        .padding(.trailing)
    }
}


struct LatestWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        LatestWeatherView(vm: LatestWeatherViewModel(reports: MockData.getMockWeatherData()))
    }
}
