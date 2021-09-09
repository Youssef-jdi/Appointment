//
//  Date+utils.swift
//  appointment
//
//  Created by Raluca Mesterca on 18/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

/// - dateWithHour: returns a Sample Like ("04-01-2019 16:01")
/// - dayNameWithMonth: returns a Sample Like ("Monday, 1 April")
/// - hour: returns a Sample Like ("16:01")
/// - dayMonthYear: returns a Sample Like ("01 April 2019")
/// - dayNumber: returns a Sample Like ("01")
/// - monthName: returns a Sample Like ("April")
enum DateFormats: String {
    case dateWithHour = "MM-dd-yyyy HH:mm"
    case dayNameWithMonth = "EEEE, d MMMM"
    case dayHalfMonthYear = "dd MMM yyyy"
    case hour = "HH:mm"
    case dayMonthYear = "dd MMMM yyyy"
    case dayNumber = "dd"
    case monthName = "MMMM"
}

extension Date {
    
    /// Hour component of the date.
    var hour: Int {
        return Calendar.calendarMonday.component(.hour, from: self)
    }

    /// Gets the day count of called Date
    var day: Int {
        return Calendar.calendarMonday.component(.day, from: self)
    }

    /// Month of called date
    var month: Int {
        let components = Calendar.calendarMonday.dateComponents([.month, .day, .year], from: self)
        return components.month!
    }

    /// Year of called date
    var year: Int {
        return Calendar.calendarMonday.component(.year, from: self)
    }

    /// Returns the weeks in a year as an array
    var weeksArray: [Int] {
        guard let range = Calendar.calendarMonday.range(of: .weekOfYear, in: .year, for: self) else { return [] }

        return Array(range)
    }

    /// Returns the month names as short symbols, i.e. 'Jan'
    var shortMonthSymbols: [String] {
        return Calendar.current.shortMonthSymbols
    }

    /// Returns the weekday names as short symbols, i.e. 'Mon'
    var shortWeekdaySymbols: [String] {
        return Calendar.calendarMonday.shortWeekdaySymbols
    }

//    /// Returns the days in a month based on a given indexPath
//    func getDayInMonth(for index: IndexPath, year: Int) -> Int? {
//        let days = getAllDays(month: index.section + 1, year: year)
//        guard index.row < days.count else { return nil }
//        return days[index.row - 1].day
//    }

    /// Adds an Component to the caller date
    ///   - value: value  to be added
    ///   - component: Which component year,month,day
    func addingComponent(value: Int, for component: Calendar.Component) -> Date {
        let cal = Calendar.calendarMonday
        return cal.date(byAdding: component, value: value, to: self)!
    }
}

//extension Date {
//
//    /// Calculates the First Date
//    ///
//    /// - Returns: The First Date Of The Year
//    func firstDayOfTheYear() -> Date {
//        return Calendar(identifier: .gregorian).date(from: Calendar.current.dateComponents([.year], from: Calendar.current.startOfDay(for: self)))!
//    }
//
//    /// Returns the WeekOfYear
//    var weekOfYear: Int {
//        return Calendar.calendarMonday.component(.weekOfYear, from: self)
//    }
//
//    /// Returns the months in an year as an array
//    var monthsArray: [Int] {
//        guard let range = Calendar.calendarMonday.range(of: .month, in: .year, for: self) else { return [] }
//
//        return Array(range)
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
//    /// Returns the WeekIndex
//    var weekIndex: Int {
//        return Calendar.calendarMonday.component(.weekday, from: self)
//    }
//
//
//    var isWeekend: Bool {
//        let saturdayIndex = WeekdayIndex.saturday.rawValue
//        let sundayIndex = WeekdayIndex.sunday.rawValue
//        return weekIndex == saturdayIndex || weekIndex == sundayIndex
//    }
//
//    /// Returns true when end of the Month
//    var isEndOfMonth: Bool {
//        return Calendar.current.dateInterval(of: .month, for: self)?.end.day == self.day
//    }
//
//    var isEndOfWeek: Bool {
//        let sundayIndex = WeekdayIndex.sunday.rawValue
//        return weekIndex == sundayIndex
//    }
//}
