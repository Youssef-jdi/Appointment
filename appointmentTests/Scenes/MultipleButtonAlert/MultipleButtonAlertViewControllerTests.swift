//
//  MultipleButtonAlertViewControllerTests.swift
//  appointmentTests
//
//  Created by Youssef Jdidi on 6/16/20.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SnapshotTesting

class MultipleButtonAlertViewControllerTests: XCTestCase {


    override func setUp() {
        super.setUp()
        record = false
    }

    override class func tearDown() {
        super.tearDown()
    }

    func testNormal() {
        let sut: MultipleButtonAlertViewController = createViewController()
        sut.set(viewModel: MultipleButtonAlertViewController.ViewModel(type: .vertical, cellType: .newAppointment))
        sut.assertSnapshots()
    }
}

// MARK: Privates
private extension MultipleButtonAlertViewControllerTests {
    func createViewController() -> MultipleButtonAlertViewController {
        let vc = R.storyboard.customPopUp.multipleButtonAlertViewController()!
        vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
        vc.lifecycle()
        return vc
    }
}
