//
//  ForgotPasswordInteractorTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 07/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//
@testable import appointment
import XCTest
import SwiftyMocky

class ForgotPasswordInteractorTests: XCTestCase {

    private let mockPresenter = ForgotPasswordPresenterProtocolMock()
    private let mockDataValidator = DataValidatorProtocolMock()
    private let mockService = ForgotPasswordServiceProtocolMock()

    func testHandleTextFieldChangeWithError() {
        let sut = createInteractor()
        Given(mockDataValidator, .validateEmail(.any, willThrow: DataValidationError.emptyEmail))
        sut.handleTextFieldChange(email: "aa@aa")
        Verify(mockPresenter, .presentValidationError(.value(.emptyEmail)))
    }

    func testHandleTextFieldChangeSuccess() {
        let sut = createInteractor()
        sut.handleTextFieldChange(email: "aa@aa.aa")
        Verify(mockPresenter, .presentValidationSuccess())
    }

    func testHandleEmailSentSuccess() {
        let response = ForgotPasswordResponse(message: "success")
        let sut = createInteractor()
        Perform(mockService, .forgetPassword(email: .any, .any, perform: { text , completion  in
            completion(.success(response))
        }))
        sut.sendEmail(email: "aa@aa.aa")
        Verify(mockPresenter, .presentEmailSentSuccess())
    }

    func testHandleEmailSentFailed() {
          let sut = createInteractor()
          Perform(mockService, .forgetPassword(email: .any, .any, perform: { text , completion  in
            completion(.failure(.statusCode(.init(statusCode: 404, data: .init()))))
          }))
          sut.sendEmail(email: "")
        Verify(mockPresenter, .presentEmailSentError(.value(ForgotPasswordError.emailNotSent)))
      }

    private func createInteractor() -> ForgotPasswordInteractor {
        return .init(presenter: mockPresenter,
                     dataValidator: mockDataValidator,
                     forgotPasswordService: mockService)
    }
}
