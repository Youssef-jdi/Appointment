//
//  LoginOverviewRouterTests.swift
//  appointment
//
//  Created by Raluca Mesterca on 03/03/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import appointment
import XCTest
import SwiftyMocky

class LoginOverviewRouterTests: XCTestCase {

    // MARK: Mocks
    private let mockViewController = LoginOverviewViewControllerProtocolMock()
    private let mockRootNavigator = RootNavigatorProtocolMock()
    private let mockStoryboard = StoryboardMock()

    var sut: LoginOverviewRouter!

    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        sut = createRouter()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testRouteToLogin() {
        let vc = LoginViewController()
        Given(mockStoryboard, .viewController(identifier: .any, willReturn: vc))

        sut.route(to: .login)

        Verify(mockStoryboard, .viewController(identifier: .matching({ return $0 as? LoginStoryboardId == .login
        })))
        Verify(mockViewController, .show(.value(vc), sender: .any))
    }

    func testRouteToRegister() {
        let vc = RegisterViewController()
        Given(mockStoryboard, .viewController(identifier: .any, willReturn: vc))

        sut.route(to: .register)

        Verify(mockStoryboard, .viewController(identifier: .matching({ return $0 as? RegisterStoryboardId == .register
        })))
        Verify(mockViewController, .show(.value(vc), sender: .any))
    }

    func testRouteToTutorial() {
        let vc = TutorialViewController()
        Given(mockStoryboard, .viewController(identifier: .any, willReturn: vc))

        sut.route(to: .tutorial)

        Verify(mockStoryboard, .viewController(identifier: .matching({ return $0 as? TutorialStoryboardId == .tutorial
        })))
        Verify(mockViewController, .show(.value(vc), sender: .any))
    }
}

// MARK: Privates
private extension LoginOverviewRouterTests {

    func createRouter() -> LoginOverviewRouter {
        let router = LoginOverviewRouter(
            rootNavigator: mockRootNavigator,
            loginStoryboard: mockStoryboard,
            registerStoryboard: mockStoryboard,
            tutorialStoryboard: mockStoryboard)

        router.set(viewController: mockViewController)

        return router
    }
}



