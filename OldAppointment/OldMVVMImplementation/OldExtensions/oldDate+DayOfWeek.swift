////
////  Date+DayOfWeek.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 9.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//enum DayOfWeekIndex: Int {
//    case monday = 2
//    case tuesday = 3
//    case wednesday = 4
//    case thursday = 5
//    case friday = 6
//    case saturday = 7
//    case sunday = 1
//}
//
//extension Date {
//    
//    /// Gets the localized short Name
//    ///
//    /// - Returns: Localized String for Day
//    func localizedDayName() -> String? {
//        let format = DateFormatter()
//        format.dateFormat = "EEE"
//        let stringDay = format.string(from: self)
//        return stringDay
//    }
//    
//    
//    /// Localized a Date to string
//    ///
//    /// - Parameter dateFormat: Given DateFormat
//    /// - Returns: String
//    func localizedDateString(dateFormat: String) -> String? {
//        let format = DateFormatter()
//        format.dateFormat = dateFormat
//        let stringDay = format.string(from: self)
//        return stringDay
//    }
//    
//    
//    /// It's a Key Enum For DateFormats
//    ///
//    /// - dateWithHour: returns a Sample Like ("04-01-2019 16:01")
//    /// - dayNameWithMonth: returns a Sample Like ("Monday, 1 April")
//    /// - hour: returns a Sample Like ("16:01")
//    /// - dayMonthYear: returns a Sample Like ("01 April 2019")
//    /// - dayNumber: returns a Sample Like ("01")
//    /// - monthName: returns a Sample Like ("April")
//    enum DateFormats: String {
//        case dateWithHour = "MM-dd-yyyy HH:mm"
//        case dayNameWithMonth = "EEEE, d MMMM"
//        case dayHalfMonthYear = "dd MMM yyyy"
//        case hour = "HH:mm"
//        case dayMonthYear = "dd MMMM yyyy"
//        case dayNumber = "dd"
//        case monthName = "MMMM"
//    }
//
//    /// Gets the day count of called Date
//    var day: Int {
//        return Calendar.calendarMonday.component(.day, from: self)
//    }
//    
//    /// Returns the WeekOfYear
//    var weekOfYear: Int {
//        return Calendar.calendarMonday.component(.weekOfYear, from: self)
//    }
//    
//    /// Returns the WeekIndex
//    var weekIndex: Int {
//        return Calendar.calendarMonday.component(.weekday, from: self)
//    }
//    
//    /// Returns the Year
//    var year: Int {
//        return Calendar.calendarMonday.component(.year, from: self)
//    }
//    
//    var isWeekend: Bool {
//        let saturdayIndex = DayOfWeekIndex.saturday.rawValue
//        let sundayIndex = DayOfWeekIndex.sunday.rawValue
//        return weekIndex == saturdayIndex || weekIndex == sundayIndex
//    }
//    
//    /// Returns true when end of the Month
//    var isEndOfMonth: Bool {
//        return Calendar.current.dateInterval(of: .month, for: self)?.end.day == self.day
//    }
//    
//    var isEndOfWeek: Bool {
//        let sundayIndex = DayOfWeekIndex.sunday.rawValue
//        return weekIndex == sundayIndex
//    }
//}
