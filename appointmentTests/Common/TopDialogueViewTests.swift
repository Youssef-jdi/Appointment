//
//  TopDialogueViewTests.swift
//  appointmentTests
//
//  Created by Jihen on 02/07/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SnapshotTesting

class TopDialogueViewTests: XCTestCase {
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        record = SnapshotTestsRecordMode.environmentVariableMappingValue
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNormal() {
        let sut = TopDialogueView(frame: .init(x: 0, y: 0, width: 375, height: 400))
        assertSnapshot(matching: sut, as: .image)
    }
    func testSmall() {
        let sut = TopDialogueView(frame: .init(x: 0, y: 0, width: 325, height: 500))
        assertSnapshot(matching: sut, as: .image)
    }
}
