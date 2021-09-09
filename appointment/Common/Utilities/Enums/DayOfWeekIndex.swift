//
//  DayOfWeekIndex.swift
//  appointment
//
//  Created by Raluca Mesterca on 21/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum WeekdayIndex: Int {
    case week = 0
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7

    var title: String {
        switch self {
        case .week:
            return "Week"
        case .sunday:
            return "Sun"
        case .monday:
            return "Mon"
        case .tuesday:
            return "Tue"
        case .wednesday:
            return "Wed"
        case .thursday:
            return "Thu"
        case .friday:
            return "Fri"
        case .saturday:
            return "Sat"
        }
    }
}
