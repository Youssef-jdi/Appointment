//
//  Calendar+utils.swift
//  appointment
//
//  Created by Raluca Mesterca on 19/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//
import Foundation

extension Calendar {

    // Weekday changed to monday and timezone changed to UTC
    static var calendarMonday: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = WeekdayIndex.monday.rawValue
//        calendar.timeZone = TimeZone(identifier: "UTC")!
        return calendar
    }
}
