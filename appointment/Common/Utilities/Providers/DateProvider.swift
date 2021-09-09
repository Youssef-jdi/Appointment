//
//  DateProvider.swift
//  
//
//  Created by Irina Filkovskaya on 12/06/2020.
//

import Foundation

//sourcery: AutoMockable
protocol DateProviderProtocol {
    /// Returns the current date.
    func today() -> Date
    
    func startOfDay(for date: Date) -> Date
    
    func startOfDay(from milliseconds: Int64) -> Date

    func isDateInToday(_ date: Date) -> Bool
    
    func date(from milliseconds: Int64) -> Date
    
    func date(bySettingHour hour: Int, minute: Int, of date: Date) -> Date
}

class DateProvider: DateProviderProtocol {
    
    private let calendar: CalendarProtocol
    
    init(calendar: CalendarProtocol) {
        self.calendar = calendar
    }
    
    func today() -> Date {
        return Date()
    }
    
    func startOfDay(for date: Date) -> Date {
        return calendar.startOfDay(for: date)
    }
    
    func date(from milliseconds: Int64) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
    func startOfDay(from milliseconds: Int64) -> Date {
        let d = date(from: milliseconds)
        let o = startOfDay(for: d)
        // TODO: Returns 8:00 instead of expected 00:00, figure it out.
        return o
    }

    func isDateInToday(_ date: Date) -> Bool {
        return calendar.isDateInToday(date)
    }

    func date(bySettingHour hour: Int, minute: Int, of date: Date) -> Date {
        let o = calendar.date(
            bySettingHour: hour,
            minute: minute,
            second: 0,
            of: date,
            matchingPolicy: .nextTime,
            repeatedTimePolicy: .first,
            direction: .forward
        ) ?? date
        return o
    }
}
