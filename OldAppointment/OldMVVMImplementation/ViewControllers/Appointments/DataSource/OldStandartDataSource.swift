////
////  StandartDataSource.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 20.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import Foundation
//
//final class AppointmentDataSource: NSObject, HasManagerWithDataSource {
//    typealias DataSourceManager = AppointmentDataSourceManager
//    
//    var dataSourceManager = DataSourceManager()
//}
//
//extension AppointmentDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataSourceManager.model[section].events.count
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return dataSourceManager.model.count
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return dataSourceManager.model[section].title
//    }
//  
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.appointmentTableViewCell.identifier) as? AppointmentTableViewCell else { return UITableViewCell() }
//        let row = indexPath.row
//        let section = indexPath.section
//        let model = dataSourceManager.model[section].events[row]
//        cell.prepareCell(title: model.title, time: model.durationTimeDescription, image: model.appointmentTypeImage)
//        return cell
//    }
//}
//
//struct AppointmentSectionModel {
//    let date: Date
//    let events: [Appointment]
//    
//    init(date: Date, events: [Appointment]) {
//        self.date = date
//        self.events = events
//    }
//    
//    var title: String {
//        return date.localizedDateString(dateFormat: Date.DateFormats.dayHalfMonthYear.rawValue)!
//    }
//}
//
//class AppointmentDataSourceManager: AppointmentDataSourceManagerProtocol {
//    var eventModel: AppointmentModel? {
//        didSet {
//            guard let appointments = eventModel?.data.appointments else { return }
//            model = appointments.groupByDay().values
//                .compactMap { (events) -> AppointmentSectionModel? in
//                    AppointmentSectionModel(date: events.first!.date, events: events)
//            }
//        }
//    }
//    
//    var model: [AppointmentSectionModel] = []
//    
//    func navigateWithEvent(at indexPath: IndexPath) {
//        guard let appointment = eventModel?.data.appointments[indexPath.row] else { return }
//        switch appointment.appointmentType {
//        case .standard: print("standart")
//        case .business: print("business")
//        case .group: print("group")
//        case .memo(let memoType):
//            switch memoType {
//            case .memo: print("memo")
//            case .memoTo: print("memoTo")
//            }
//        default: break
//        }
//    }
//}
