////
////  DateCalculationTests.swift
////  appointmentTests
////
////  Created by Onur Hüseyin Çantay on 29.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import XCTest
//
//@testable import appointment
//
//class DateCalculationTests: XCTestCase {
//
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testGetDayFromDateTest() {
//        let date = Date()
//        XCTAssert(date.day == Calendar.current.component(.day, from: date), "Days doesn't Match")
//    }
//    
//    func testYearlyDateCreation() {
//        for x in 2000...3000 {
//            let dates = Calendar.calendarMonday.getGroupedDatesByYearAndWeek(year: x)
//            let componentsStart = DateComponents(calendar: Calendar.calendarMonday,weekOfYear: 1,yearForWeekOfYear: x)
//            let startDate = Calendar.calendarMonday.date(from: componentsStart)!
//            let componentsEnd = DateComponents(calendar: Calendar.calendarMonday,weekOfYear: 1,yearForWeekOfYear: x + 1)
//            let endDate = Calendar.calendarMonday.date(from: componentsEnd)!
//            if dates[x]![0]!.first!.compare(startDate) != .orderedSame
//                && dates[x]![52]!.last!.compare(endDate) != .orderedSame {
//                XCTAssertFalse(true)
//            }
//        }
//        XCTAssertTrue(true)
//    }
//    
//    func testAddingComponentWithMonth() {
//        for x in 1...12 {
//            let components = DateComponents(calendar: Calendar.calendarMonday, year: 2019, month: x)
//            let dateFromComponents = Calendar.calendarMonday.date(from: components)!
//            let newDate = dateFromComponents.addingComponent(value: 1, for: .month)
//            if newDate.year == dateFromComponents.year {
//                if newDate.month == dateFromComponents.month + 1 % 12 {
//                    continue
//                } else {
//                    XCTAssertFalse(true)
//                    break
//                }
//            }
//        }
//        XCTAssertTrue(true)
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//
//}
