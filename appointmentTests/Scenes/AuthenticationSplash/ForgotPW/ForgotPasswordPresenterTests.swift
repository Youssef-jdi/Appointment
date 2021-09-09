//
//  ForgotPasswordPresenterTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 07/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//
@testable import appointment
import XCTest
import SwiftyMocky

class ForgotPasswordPresenterTests: XCTestCase {
    private let mockViewController = ForgotPasswordViewControllerProtocolMock()

    func testValidationError() {
        let sut = createPresenter()
        sut.presentValidationError(.emptyConfirmPassword)
        Verify(mockViewController, .displayValidationError(.value(DataValidationError.emptyConfirmPassword.localizedDescription)))
    }

    func testSuccess() {
        let sut = createPresenter()
        sut.presentValidationSuccess()
        Verify(mockViewController, .displayValidationSuccess())
    }

    func testEmailSendError() {
        let sut = createPresenter()
        sut.presentEmailSentError(.emailNotSent)
        Verify(mockViewController, .displayEmailSentError(.value(ForgotPasswordError.emailNotSent)))
    }

    func testEmailSentSuccess() {
        let sut = createPresenter()
        sut.presentEmailSentSuccess()
        Verify(mockViewController, .displayEmailSentSuccess())
    }

    private func createPresenter() -> ForgotPasswordPresenter {
         let presenter =  ForgotPasswordPresenter()
         presenter.set(viewController: mockViewController)
         return presenter
     }
}
