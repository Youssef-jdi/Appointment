//
//  AvailabilityOverviewRouterTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky

class AvailabilityOverviewRouterTests: XCTestCase {

    private let mockViewController =  AvailabilityOverviewViewControllerProtocolMock()

    func testGoBack() {
        let sut = createRouter()
        sut.route(to: .goBack)
        Verify(mockViewController, .pop(animated: .value(true)))
    }

    private func createRouter() -> AvailabilityOverviewRouter {
        let router = AvailabilityOverviewRouter()
        router.set(viewController: mockViewController)
        return router
    }
}
