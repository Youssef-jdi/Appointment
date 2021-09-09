//
//  AvailabilityOverviewViewControllerTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky
import SnapshotTesting

class AvailabilityOverviewViewControllerTests: XCTestCase {

    private let mockInteractor = AvailabilityOverviewInteractorProtocolMock()
    private let mockRouter = AvailabilityOverviewRouterProtocolMock()

    
    override func setUp() {
        super.setUp()

        record = SnapshotTestsRecordMode.environmentVariableMappingValue
    }

    func testNormal() {
        let sut = createViewController()
        sut.set(date:(Appointment.mock().dates?[0])!)
        sut.assertSnapshots()
    }

    private func createViewController() ->  AvailabilityOverviewViewController {
        let vc = R.storyboard.invitation.availabilityOverviewViewController()!
        vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
        vc.set(router: mockRouter)
        vc.set(interactor: mockInteractor)
        vc.lifecycle()
        return vc
       }
}
