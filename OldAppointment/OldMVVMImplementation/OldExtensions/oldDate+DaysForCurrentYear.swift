////
////  Date+GetAllDays.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 11.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//extension Date {
//    
//    /// Month of called date
//    var month: Int {
//        let components = Calendar.calendarMonday.dateComponents([.month, .day, .year], from: self)
//        return components.month!
//    }
//    
//    /// Calculates the First Date
//    ///
//    /// - Returns: The First Date Of The Year
//    func firstDayOfTheYear() -> Date {
//        return Calendar.current.date(from: Calendar.current.dateComponents([.year], from: Calendar.current.startOfDay(for: self)))!
//    }
//    
//    /// Adds an Component to the caller date
//    ///
//    /// - Parameters:
//    ///   - value: value  to be added
//    ///   - component: Which component year,month,day
//    /// - Returns: A Date
//    func addingComponent(value: Int, for component: Calendar.Component) -> Date {
//        let cal = Calendar.calendarMonday
//        return cal.date(byAdding: component, value: value, to: self)!
//    }
//    
//    /// Gets all days for Month
//    ///
//    /// - Parameter month: month index
//    /// - Returns: An array of Date
//    func getDaysForMonth(for month: Int = Date().month) -> [Date] {
//        let calendar = Calendar.calendarMonday
//        var day = firstDayOfTheYear()
//        day = calendar.date(byAdding: .month, value: month - 1, to: day)!
//        let range = calendar.range(of: .day, in: .month, for: self)!
//        return zip(Array(repeating: day, count: range.count), range)
//            .map { $0.0.addingComponent(value: $0.1, for: .day) }
//    }
//}
//
//extension Calendar {
//    
//    /// Weekday changed to monday and timezone changed to UTC
//    static var calendarMonday: Calendar {
//        var calendar = Calendar.current
//        calendar.firstWeekday = DayOfWeekIndex.monday.rawValue
//        calendar.timeZone = TimeZone(identifier: "UTC")!
//        return calendar
//    }
//}
