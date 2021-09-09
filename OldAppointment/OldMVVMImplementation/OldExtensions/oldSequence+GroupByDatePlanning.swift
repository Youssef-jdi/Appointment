////
////  Sequence+GroupByDatePlanning.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 11.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//extension Sequence where Self.Iterator.Element == PlanningAppointmentModel {
//    
//    /// Groups by Day Year and Month
//    ///
//    /// - Returns: [DateComponents: [PlanningAppointmentModel]]
//    func groupByDate() -> [DateComponents: [PlanningAppointmentModel]] {
//        let groupDict = Dictionary(grouping: self) { app -> DateComponents in
//            let date = Calendar.calendarMonday.dateComponents([.day, .year, .month], from: (Date(timeIntervalSince1970: app.timestamp)))
//            return date
//        }
//        return groupDict
//    }
//}
