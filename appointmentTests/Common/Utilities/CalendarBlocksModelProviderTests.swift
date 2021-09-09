//
//  CalendarItemsModelProviderTests.swift
//  appointmentTests
//
//  Created by Irina Filkovskaya on 11.06.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky
import Nimble

class CalendarItemsModelProviderTests: XCTestCase {
    
    func test4OverlappingWithLimitTo3() {
        let blocksLimit = 3
        let mockItems: [CalendarItem] = [
            .init(title: "01", startTime: 1, endTime: 10),
            .init(title: "02", startTime: 2, endTime: 7),
            .init(title: "02-1", startTime: 2, endTime: 7),
            .init(title: "03", startTime: 6, endTime: 11),
            .init(title: "04", startTime: 13, endTime: 15),
            .init(title: "05", startTime: 17, endTime: 19),
            .init(title: "06", startTime: 19, endTime: 21),
            .init(title: "07", startTime: 21, endTime: 23)
        ]
        
        let expectedModel: [Int: [CalendarItem?]] = [
            1: [.init(title: "01", startTime: 1, endTime: 10), nil, nil],
            2: [.init(title: "01", startTime: 1, endTime: 10),
                .init(title: "02", startTime: 2, endTime: 7),
                .init(title: "02-1", startTime: 2, endTime: 7)],
            3: [.init(title: "01", startTime: 1, endTime: 10),
                .init(title: "02", startTime: 2, endTime: 7),
                .init(title: "02-1", startTime: 2, endTime: 7)],
            4: [.init(title: "01", startTime: 1, endTime: 10),
                .init(title: "02", startTime: 2, endTime: 7),
                .init(title: "02-1", startTime: 2, endTime: 7)],
            5: [.init(title: "01", startTime: 1, endTime: 10),
                .init(title: "02", startTime: 2, endTime: 7),
                .init(title: "02-1", startTime: 2, endTime: 7)],
            6: [.init(title: "01", startTime: 1, endTime: 10),
                .init(title: "02", startTime: 2, endTime: 7),
                .init(title: "02-1", startTime: 2, endTime: 7)],
            7: [.init(title: "01", startTime: 1, endTime: 10),
                .init(title: "02", startTime: 2, endTime: 7),
                .init(title: "02-1", startTime: 2, endTime: 7)],
            8: [.init(title: "01", startTime: 1, endTime: 10), nil, nil],
            9: [.init(title: "01", startTime: 1, endTime: 10), nil, nil],
            10: [.init(title: "01", startTime: 1, endTime: 10), nil, nil],
            13: [.init(title: "04", startTime: 13, endTime: 15), nil, nil],
            14: [.init(title: "04", startTime: 13, endTime: 15), nil, nil],
            15: [.init(title: "04", startTime: 13, endTime: 15), nil, nil],
            17: [.init(title: "05", startTime: 17, endTime: 19), nil, nil],
            18: [.init(title: "05", startTime: 17, endTime: 19), nil, nil],
            19: [.init(title: "05", startTime: 17, endTime: 19),
                 .init(title: "06", startTime: 19, endTime: 21),
                 nil],
            20: [nil,
                 .init(title: "06", startTime: 19, endTime: 21),
                 nil],
            21: [nil,
                 .init(title: "06", startTime: 19, endTime: 21),
                 .init(title: "07", startTime: 21, endTime: 23)],
            22: [nil, nil, .init(title: "07", startTime: 21, endTime: 23)],
            23: [nil, nil, .init(title: "07", startTime: 21, endTime: 23)]]
        
        let sut = createProvider()
        expect(sut.model(
            from: mockItems,
            maxDisplayableTogether: blocksLimit)) == expectedModel

    }
    
    func testOneBlock() {
        let blocksLimit = 3
        let mockItems: [CalendarItem] = [.init(title: "Name", startTime: 8, endTime: 10)]
        let expectedModel: [Int: [CalendarItem?]] = [
            8: [.init(title: "Name", startTime: 8, endTime: 10)],
            9: [.init(title: "Name", startTime: 8, endTime: 10)],
            10: [.init(title: "Name", startTime: 8, endTime: 10)]
        ]
        
        let sut = createProvider()
        expect(sut.model(
            from: mockItems,
            maxDisplayableTogether: blocksLimit)) == expectedModel    }

    // MARK: - Privates
    private func createProvider() -> CalendarBlocksModelProvider {
        return .init()
    }
}
