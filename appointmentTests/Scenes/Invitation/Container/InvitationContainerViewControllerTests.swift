//
//  InvitationContainerViewControllerTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 07/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky
import SnapshotTesting

class InvitationContainerViewControllerTests: XCTestCase {

    private let mockRouter = InvitationContainerRouterProtocolMock()
    private let mockInteractor = InvitationContainerInteractorProtocolMock()

    func testDisplayOutgoing() {
        let sut = createViewController()
        sut.goToOutGoing()
        Verify(mockInteractor, .handleChangeState(state: .value(.outGoing)))
        sut.assertSnapshots(named: "InvitationContainerViewControllerTestsOutgoing")
    }

    func testDisplayIncoming() {
        let sut = createViewController()
        sut.containerTabViewTapped()
        Verify(mockInteractor, .handleChangeState(state: .value(.inComing)))
        sut.displayContainerTabView(.inComing, animated: true)
        sut.assertSnapshots(named: "InvitationContainerViewControllerTestsIncoming")
    }

    func testDisplayChild() {
        let sut = createViewController()
        sut.displayChild(OutGoingViewController())
        sut.assertSnapshots()
    }

    private func createViewController() -> InvitationContainerViewController {
        let vc = UIStoryboard(name: "Invitation", bundle: nil).instantiateViewController(withIdentifier: R.storyboard.invitation.invitationContainerViewController.identifier) as! InvitationContainerViewController
        vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
        vc.set(router: mockRouter)
        vc.set(interactor: mockInteractor)
        vc.lifecycle()
        return vc

    }
}
