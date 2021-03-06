//
//  OutGoingPresenterTests.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/3/20.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import appointment
import XCTest
import SwiftyMocky

class OutGoingPresenterTests: XCTestCase {

    // MARK: Mocks
    private let mockViewController = OutGoingViewControllerProtocolMock()
    private var sut: OutGoingPresenter!

    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        sut = createPresenter()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testPresentData() {
        let invitations = Array(repeating: Appointment.mock(), count: 10)
        sut.present(outGoingDataSource: invitations)
        Verify(mockViewController, .set(outGoingDataSource: .value(invitations)))
    }
}

// MARK: - Privates
private extension OutGoingPresenterTests {

    func createPresenter() -> OutGoingPresenter {
        let presenter =  OutGoingPresenter()
        presenter.set(viewController: mockViewController)
        return presenter
    }
}


