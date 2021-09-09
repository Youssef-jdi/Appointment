//
//  ForgotPasswordRouterTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 07/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky

class ForgotPasswordRouterTests: XCTestCase {
    private let mockRootNavigator = RootNavigatorProtocolMock()
    private let mockStoryboard = StoryboardMock()
    private let mockViewController = ForgotPasswordViewControllerProtocolMock()

    // TODO: - Nothing to test yet. 

    private func createRouter() -> ForgotPasswordRouter {
        let router = ForgotPasswordRouter(rootNavigator: mockRootNavigator, destinationStoryboard: mockStoryboard)
        router.set(viewController: mockViewController)
        return router
    }
}
 
