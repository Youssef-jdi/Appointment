//
//  Date+milliseconds.swift
//  appointment
//
//  Created by Raluca Mesterca on 06/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

extension Date {

    /// Convert date to unix timestamp in milliseconds
    func dateInMilliseconds() -> Int64 {
        let since1970 = self.timeIntervalSince1970
        return Int64(since1970 * 1000)
    }
}

extension Int64 {

    /// Convert Milliseconds to date
    func dateFromMilliseconds() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self / 1000))
    }
    // synonymous to DateProvider's method `date(from milliseconds: Int64) -> Date`
}
