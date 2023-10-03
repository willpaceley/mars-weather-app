//
//  WeatherReportListView.swift
//  MarsWeather
//
//  Created by Will Paceley on 2023-08-10.
//

import SwiftUI

struct WeatherReportListView: View {
    @ObservedObject var vm: MarsWeatherViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Last 30 Days")
                .subheading()
            
            if let selectedReport = vm.selectedReport {
                
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
                }
                .onAppear {
                    UIRefreshControl.appearance().tintColor = UIColor.orange
                }
            }
            
        }
#if DEBUG
        .task {
            await vm.getWeatherData()
        }
#endif
    }
}

struct WeatherReportListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherReportListView(
            vm: MarsWeatherViewModel(
                dataProvider: MockDataProvider()
            )
        )
    }
}
