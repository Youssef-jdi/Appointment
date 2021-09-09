//
//  InvitationContainerRouterTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 07/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky

class InvitationContainerRouterTests: XCTestCase {

    private let mockViewController = InvitationContainerViewControllerProtocolMock()
    private let mockStoryboard = StoryboardMock()

    func testShowPopUp() {
        let sut = createRouter()
        let popup = MultipleButtonAlertViewController()
        Given(mockStoryboard, .viewController(identifier: .any, willReturn: popup))
        sut.route(to: .showPopUp)
        Verify(mockViewController, .present(.value(popup), animated: .value(true), completion: .any))
        Verify(mockStoryboard, .viewController(identifier: .matching({
            return $0 as? CustomPopUpStoryboardId == .multipleButton
        })))
    }

    private func createRouter() -> InvitationContainerRouter {
         let router = InvitationContainerRouter(addPopUpStoryboard: mockStoryboard)
         router.set(viewController: mockViewController)
         return router
     }
}
