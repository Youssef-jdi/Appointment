////
////  Sequence+HolidayGrouper.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 22.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//extension Sequence where Iterator.Element == HolidayModel {
//    func groupByMonth() -> [Int: [HolidayModel]] {
//        let groupDict = Dictionary(grouping: self) { app -> Int in
//            let dict = app.date.month
//            return dict
//        }
//        return groupDict
//    }
//}
