//
//  InvitationContainerPresenterTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 07/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//
import XCTest
import SwiftyMocky

@testable import appointment
class InvitationContainerPresenterTests: XCTestCase {

    private let mockViewController = InvitationContainerViewControllerProtocolMock()
    private let mockStoryboard = StoryboardMock()

    func testPresentOutGoing() {
        let sut = createPresenter()
        let vc = OutGoingViewController()
        Given(mockStoryboard, .viewController(identifier: .any, willReturn: vc))
        sut.presentInitialView(with: .outGoing)
        Verify(mockViewController, .displayChild(.value(vc)))
        Verify(mockStoryboard, .viewController(identifier: .matching({
            return $0 as? InvitationStoryboardId == .outgoing
        }) ))
    }

    func testPresentInComing() {
        let sut = createPresenter()
        let vc = InComingViewController()
        Given(mockStoryboard, .viewController(identifier: .any, willReturn: vc))
        sut.presentInitialView(with: .inComing)
        Verify(mockViewController, .displayChild(.value(vc)))
        Verify(mockStoryboard, .viewController(identifier: .matching({
            return $0 as? InvitationStoryboardId == .incoming
        }) ))
    }

    func testPresentContainerOutGoing() {
        let sut = createPresenter()
        sut.presentContainerTabView(.outGoing)
        Verify(mockViewController, .displayContainerTabView(.value(.outGoing), animated: true))
    }

    func testPresentContainerIncoming() {
        let sut = createPresenter()
        sut.presentContainerTabView(.inComing)
        Verify(mockViewController, .displayContainerTabView(.value(.inComing), animated: true))
    }

    private func createPresenter() -> InvitationContainerPresenter {
        let presenter = InvitationContainerPresenter(invitationStoryboard: mockStoryboard)
        presenter.set(viewController: mockViewController)
        return presenter
    }
}
