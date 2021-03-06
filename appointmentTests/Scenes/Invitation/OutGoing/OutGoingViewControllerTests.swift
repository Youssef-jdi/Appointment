//
//  OutGoingViewControllerTests.swift
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
import SnapshotTesting

class OutGoingViewControllerTests: XCTestCase {

    // MARK: Mocks
    private let mockRouter = OutGoingRouterProtocolMock()
    private let mockInteractor = OutGoingInteractorProtocolMock()
    private let mockAlertPresenter = AlertPresenterProtocolMock()

    var sut: OutGoingViewController!

    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        // always use iphone8 (Simulator) -> Snapshots
         record = SnapshotTestsRecordMode.environmentVariableMappingValue
         sut = createViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testNormal() {
        let data = Array(repeating: Appointment.mock(), count: 10)
        sut.set(outGoingDataSource: data)
        sut.assertSnapshots()
    }

    #warning("TODO, 2020-MAR-27, Sam, Add more tests")
}

// MARK: Privates
private extension  OutGoingViewControllerTests {

    func createViewController() ->  OutGoingViewController {
        let dataSource = InvitationDataSource()
        let vc = R.storyboard.invitation.outGoingViewController()!
        vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
        vc.set(router: mockRouter)
        vc.set(interactor: mockInteractor)
        vc.set(dataSource: dataSource)
        vc.lifecycle()
        return vc
    }
}
