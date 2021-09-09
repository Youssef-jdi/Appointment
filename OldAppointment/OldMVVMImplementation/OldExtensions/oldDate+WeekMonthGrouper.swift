////
////  Sequence+Date.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 27.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//extension Calendar {
//    
//    /// Groupes Yearly dates with WeekOfYear
//    ///
//    /// - Parameter year: Year that wanted to be grouped
//    /// - Returns: A Dictionary of Year keys and inside years there will be the WeekOfMonth
//    func getGroupedDatesByYearAndWeek(year: Int) -> [Int: [Int: [Date]]] {
//        let dates = dateListGenerator(for: year)
//        let groupedDates = Dictionary(grouping: dates, by: components)
//        /// first we group the dates by YearForWeekOfYear whic returns us a year key and values
//        let months = groupedDates.map { grouping in return Dictionary<Int, [Date]> (
//            grouping: grouping.value,
//            by: { components(from: $0).yearForWeekOfYear! })
//        }
//        /// then we reduce the array and merge them with unique keys
//        let yearsUnique = months.reduce([:], { acc, x in
//            return acc.merging(x, uniquingKeysWith: { $0 + $1 })
//        })
//        /// as last we group the values again but this time with weekOfYear and set the values as key
//        return yearsUnique.mapValues { dates in
//            return Dictionary<Int, [Date]>(
//                grouping: dates,
//                by: { components(from: $0).weekOfYear! - 1 })
//        }
//    }
//    
//    /// Returns all dates in a month off a year
//    ///
//    /// - Parameters:
//    ///   - month: The month
//    ///   - year: The year
//    /// - Returns: All dates in {month} off {year} grouped by week
//    func getAllDates(month: Int, year: Int) -> WeekDates {
//        let dateComponents = DateComponents(year: year, month: month)
//        let date = self.date(from: dateComponents)!
//        
//        /// All days in the month of year
//        let daysForMonth = date.getDaysForMonth(for: month)
//        
//        var weekDates = WeekDates()
//        
//        let monthStartsOnDayIndex = date.weekIndex
//        let skipAmountOfCells = monthStartsOnDayIndex - 1
//        
//        /// Skip the first days of a month, so
//        /// If the month starts on a Thursday the first 3 days (Monday, Tuesday, Wednesday) will be skipped
//        (0..<skipAmountOfCells).forEach { _ in
//            weekDates.appendDate(nil)
//        }
//        
//        /// Add the weeknumber to the array if its the first day of the month,
//        /// or the day of the week is a monday
//        for (index, day) in daysForMonth.enumerated() {
//            if index == 0 || day.weekIndex == DayOfWeekIndex.monday.rawValue {
//                let week = day.weekOfYear
//                weekDates.appendWeekNumber(week)
//            }
//            weekDates.appendDate(day)
//        }
//        return weekDates
//    }
//    
//    /// Returns needed Components for date
//    ///
//    /// - Parameter date: date to be seperated to its components
//    /// - Returns: DateComponents
//    private func components(from date: Date) -> DateComponents {
//        return dateComponents([.weekOfYear, .yearForWeekOfYear], from: date)
//    }
//    
//    /// Generates a List Of Date with WeekOfYear
//    ///
//    /// - Parameter year: Which Year the dates will belong
//    /// - Returns: A list of Date
//    private func dateListGenerator(for year: Int) -> [Date] {
//        /// we are trying to get the first date of the year depends on first week of the year
//        let componentsStart = DateComponents(calendar: self, weekOfYear: 1, yearForWeekOfYear: year)
//        var startDate = date(from: componentsStart)!
//        /// and get the second date from second year with the begining week so generate a list of date between this to date
//        let componentsEnd = DateComponents(calendar: self, weekOfYear: 1, yearForWeekOfYear: year + 1)
//        var totalDays: [Date] = [startDate]
//        let endDate = date(from: componentsEnd)!
//        while startDate.compare(endDate) == .orderedAscending {
//            startDate = startDate.addingComponent(value: 1, for: .day)
//            totalDays.append(startDate)
//        }
//        return totalDays
//    }
//}
//
//struct WeekDates {
//    var weekNumbers: [Int] = []
//    var dates: [Date?] = []
//    
//    mutating func appendWeekNumber(_ weekNr: Int) {
//        self.weekNumbers.append(weekNr)
//    }
//    
//    mutating func appendDate(_ date: Date?) {
//        self.dates.append(date)
//    }
//}
