//
//  CustomDialogsViewTests.swift
//  appointmentTests
//
//  Created by Jihen on 26/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SnapshotTesting

class CustomDialogsViewTests: XCTestCase {
    
    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()

         record = SnapshotTestsRecordMode.environmentVariableMappingValue
    }

    func testNormal() {
        let sut = CustomDialogsView()
        sut.layoutSubviews()
        assertSnapshot(matching: sut, as: .image)
    }
    
    private func CustomDialogsView() -> CustomDialogView {
        return CustomDialogView(frame: .init(x: 0, y: 0, width: 350, height: 300))
    }
}
