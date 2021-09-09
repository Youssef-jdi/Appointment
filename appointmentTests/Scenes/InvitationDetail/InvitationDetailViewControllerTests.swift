//
//  InvitationDetailViewControllerTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 27/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky
import SnapshotTesting

class InvitationDetailViewControllerTests: XCTestCase {
    // MARK: Mocks
    private let mockRouter = InvitationDetailRouterProtocolMock()
    private let mockInteractor = InvitationDetailInteractorProtocolMock()

    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        // always use iphone8 (Simulator) -> Snapshots
         record = SnapshotTestsRecordMode.environmentVariableMappingValue
    }

    override func tearDown() {
        super.tearDown()
    }

    func testNormalOutGoing() {
        let sut = createViewController()
        sut.set(invitation: Appointment.mock(), isOutgoing: true)
        sut.assertSnapshots(named: "InvitationDetailViewControllerOutgoing")
    }

    func testNormalIncoming() {
        let sut = createViewController()
        sut.set(invitation: Appointment.mock(), isOutgoing: false)
        sut.assertSnapshots(named: "InvitationDetailViewControllerIncoming")
    }
    
    func testOutgoingCancelled() {
        let sut = createViewController()
        sut.set(invitation: Appointment.mockCancelled(), isOutgoing: false)
        sut.lifecycle()
        sut.assertSnapshots(named: "InvitationDetailViewControllerOutgoingCancelled")
    }

    func testCancelClick() {
        let sut = createViewController()
        sut.cancelClicked(self)
        //Verify(mockRouter, .route(to: .value(.backToInvitation)))
    }

    #warning("TODO, 2020-MAR-27, Sam, Add more tests in future.")

    private func createViewController() ->  InvitationDetailViewController {
        let vc = R.storyboard.invitationDetail.invitationDetailViewController()!
        vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
        vc.set(router: mockRouter)
        vc.set(interactor: mockInteractor)
        vc.lifecycle()
        return vc
       }
}

