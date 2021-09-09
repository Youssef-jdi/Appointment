//
//  CalendarProtocol.swift
//  appointment
//
//  Created by Irina Filkovskaya on 12/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol CalendarProtocol {
    
    func dateComponents(_ components: Set<Calendar.Component>, from date: Date) -> DateComponents
    func component(_ component: Calendar.Component, from date: Date) -> Int
    func compare(_ date1: Date, to date2: Date, toGranularity component: Calendar.Component) -> ComparisonResult
    
    func startOfDay(for date: Date) -> Date
//    func date(byAdding component: Calendar.Component, value: Int, to date: Date, wrappingComponents: Bool) -> Date?
    /// Returns dates between start and end ordered from oldest to newest.
//    func dates(from start: Date, to end: Date) -> [Date]
    func isDateInToday(_ date: Date) -> Bool
//    func isDateInYesterday(_ date: Date) -> Bool
    
    func date(bySettingHour hour: Int, minute: Int, second: Int, of date: Date, matchingPolicy: Calendar.MatchingPolicy, repeatedTimePolicy: Calendar.RepeatedTimePolicy, direction: Calendar.SearchDirection) -> Date?
}

extension Calendar: CalendarProtocol {
    
    func dates(from start: Date, to end: Date) -> [Date] {
        var date = start
        var dates: [Date] = []
        while date <= end {
            dates.append(date)
            date = self.date(byAdding: .day, value: 1, to: date)! //swiftlint:disable:this force_unwrapping
        }
        return dates
    }
}

// TODO: Inject everywhere instead of instantiating Calendar() everywhere
