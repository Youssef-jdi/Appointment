//
//  LoginPresenterTests.swift
//  appointment
//
//  Created by Raluca Mesterca on 18/02/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import XCTest
import SwiftyMocky


@testable import appointment
class LoginPresenterTests: XCTestCase {

    // MARK: - Mocks
    private let mockViewController = LoginViewControllerProtocolMock()
    private var sut: LoginPresenter!

    // MARK: Setup/Teardown
     override func setUp() {
         super.setUp()
         sut = createPresenter()
     }

     override func tearDown() {
         super.tearDown()
         sut = nil
     }

    // MARK: Tests
    func testPresentLoginSuccess() {
        sut.presentLoginSuccess()
        Verify(mockViewController, .handleLoginSuccess())
    }

    func testPresentLoginError() {
        sut.presentLoginError()
        Verify(mockViewController, .handleLoginFailure(error: .value(AuthError.wrongCredentials.localizedDescription)))
    }

    func testPresentInvalidData() {
        let error = DataValidationError.invalidEmail
        sut.presentInvalidData(error)
        Verify(mockViewController, .displayInvalidEmail(error: .value(error.localizedDescription)))
    }
    
    func testPresentInvalidPasswordError() {
        let error = DataValidationError.invalidPassword
        sut.presentInvalidData(error)
        Verify(mockViewController, .displayInvalidPassword(error: .value(error.localizedDescription)))
    }
    
    func testPresentInvalidEmailError() {
        let error = DataValidationError.invalidEmail
        sut.presentInvalidData(error)
        Verify(mockViewController, .displayInvalidEmail(error: .value(error.localizedDescription)))
    }
    
    func testPresentGenericError() {
        let error = DataValidationError.emptyFields
        sut.presentInvalidData(error)
        Verify(mockViewController, .displayGeneric(error: .value(error.localizedDescription)))
    }

    func testOtherErrorsAreNeverShown() {
        let error = DataValidationError.emptyConfirmPassword
        sut.presentInvalidData(error)
        Verify(mockViewController, 0, .displayGeneric(error: .value(error.localizedDescription)))
        Verify(mockViewController, 0, .displayInvalidEmail(error: .value(error.localizedDescription)))
        Verify(mockViewController, 0, .displayInvalidPassword(error: .value(error.localizedDescription)))
    }
}

// MARK: - Privates
private extension LoginPresenterTests {

    func createPresenter() -> LoginPresenter {
        let presenter = LoginPresenter()
        presenter.set(viewController: mockViewController)
        return presenter
    }
}
