//
//  SyncRouterTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 06/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky

class SyncRouterTests: XCTestCase {

    private let mockRootNavigator = RootNavigatorProtocolMock()
    private let mockStoryboard = StoryboardMock()
    private let mockViewController = SyncViewControllerProtocolMock()

    func testRouteHome() {
        let sut = createRouter()
        let vc = HomeViewController()
        Given(mockStoryboard, .viewController(identifier: .any, willReturn: vc))
        sut.route(to: .home)
        Verify(mockStoryboard, .viewController(identifier: .matching({
            return $0 as? HomeStoryboardId == .home
        })))
        Verify(mockRootNavigator, .setSideMenuRoot(contentViewController: .matching({
            return $0 is ApplicationNavigationController
        })))
    }


    private func createRouter() -> SyncRouter {
        let router = SyncRouter(rootNavigator: mockRootNavigator,
                                homeStoryboard: mockStoryboard)
        router.set(viewController: mockViewController)
        return router
    }
}
