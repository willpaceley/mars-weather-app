//
//  LatestWeatherView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-04-27.
//

import SwiftUI

struct LatestWeatherView: View {
    @ObservedObject var vm: MarsWeatherViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let selectedReport = vm.selectedReport {
                MarsDateView(report: selectedReport)
                    .padding(.bottom, 5)
                
                WeatherReportView(
                    vm: WeatherReportViewModel(
                        selectedReport: selectedReport,
                        reports: vm.reports
                    )
                )
                
                Divider()
                    .padding(.top)
                
                SubHeaderView(title: "Last 30 Days")
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                
                List(vm.recentReports) { report in
                    ReportListCellView(
                        report: report,
                        lowestTemp: vm.lowestTemp,
                        highestTemp: vm.highestTemp,
                        isSelected: report.id == selectedReport.id
                    )
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                    .onTapGesture {
                        vm.selectedReport = report
                    }
                }
                .listStyle(.plain)
                .refreshable {
                    await vm.getWeatherData(forceFetch: true)
//                    vm.showAlert(for: .invalidURL)
                }
                .onAppear {
                    UIRefreshControl.appearance().tintColor = UIColor.orange
                }
            }
        }
    }
}


struct LatestWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        LatestWeatherView(
            vm: MarsWeatherViewModel(
                dataProvider: MockDataProvider()
            )
        )
    }
}
