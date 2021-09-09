////
////  Sequence+HomeAppointmentGrouper.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 12.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//extension Sequence where Iterator.Element == Appointment {
//    func groupByDate() -> [DateComponents: [Appointment]] {
//        let groupDict = Dictionary(grouping: self) { app -> DateComponents in
//            let date = Calendar.calendarMonday.dateComponents([.weekOfYear,.weekday,.day], from: (Date(timeIntervalSince1970: app.timestamp)))
//            return date
//        }
//        return groupDict
//    }
//    func groupByDay() -> [Int: [Appointment]] {
//        let groupDict = Dictionary(grouping: self) { app -> Int in
//            let date = Calendar.calendarMonday.dateComponents([.day], from: (Date(timeIntervalSince1970: app.timestamp)))
//            return date.day! - 1
//        }
//        return groupDict
//    }
//}
