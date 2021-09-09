//
//  InvitationDetailRouterTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 27/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky

class InvitationDetailRouterTests: XCTestCase {
    // MARK: - Mocks
    private let mockStoryboard = StoryboardMock()
    private let mockInvitationStoryboard = StoryboardMock()
    private let mockChatStoryboard = StoryboardMock()
    private let mockInvitationDetailStoryboard = StoryboardMock()
    private let mockPopupStoryboard = StoryboardMock()
    private let mockViewController = InvitationDetailViewControllerProtocolMock()

    func testRouteToInvitation() {
        let sut = createRouter()
        //sut.route(to: .cancel(delegate: <#T##CustomPopupWithTwoButtonsDelegate#>))
        //Verify(mockViewController, .pop(animated: .value(true)))
    }
}

// MARK: - Private
private extension InvitationDetailRouterTests {

    func createRouter() -> InvitationDetailRouter {
        let router = InvitationDetailRouter(chatStoryboard: mockChatStoryboard, invitationStoryboard: mockInvitationStoryboard, invitationDetailStoryboard: mockInvitationDetailStoryboard, popupStoryboard: mockPopupStoryboard)
        router.set(viewController: mockViewController)
        return router
    }
}
