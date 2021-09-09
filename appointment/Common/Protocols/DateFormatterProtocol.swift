//
//  DateFormatterProtocol.swift
//  appointment
//
//  Created by Tran Gia Huy on 04/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//
import Foundation

//sourcery: AutoMockable
protocol DateFormatterProtocol {
    var dateFormat: String! { get set }
    var timeStyle: DateFormatter.Style { get set }
    var dateStyle: DateFormatter.Style { get set }
    var locale: Locale! { get set }
    var doesRelativeDateFormatting: Bool { get set }
    var timeZone: TimeZone! { get set }

    func string(from date: Date) -> String
    func date(from string: String) -> Date?
    func createDate(date: Date, dateFormat: String) -> Date?
    func formatDate(date: Date, format: String ) -> String
    
    /// Returns an Integer representation of the date in milliseconds.
    func int64(from date: Date) -> Int64
}

extension DateFormatter: DateFormatterProtocol {}

extension DateFormatter {
    /// This function use to ignore HH:mm:ss in Date in order to compare 2 dates
    func createDate(date: Date, dateFormat: String) -> Date? {
        self.dateFormat = dateFormat
        self.timeZone = .current
        let stringDay = string(from: date)
        let newDateFormat = self.date(from: stringDay)
        return newDateFormat
    }

    func formatDate(date: Date, format: String ) -> String {
         self.dateFormat = format
         return self.string(from: date)
     }
    
    func int64(from date: Date) -> Int64 {
        let timeInterval = date.timeIntervalSince1970
        return Int64(timeInterval * 1000)
    }
}
