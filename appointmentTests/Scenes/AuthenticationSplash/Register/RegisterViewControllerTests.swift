//
//  RegisterViewControllerTests.swift
//  appointment
//
//  Created by Rachel Polachova on 27/02/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import appointment

import XCTest
import SwiftyMocky
import SnapshotTesting


class RegisterViewControllerTests: XCTestCase {

    // MARK: Mocks
    private let mockRouter = RegisterRouterProtocolMock()
    private let mockAlertPresenter = AlertPresenterProtocolMock()
    private let mockInteractor = RegisterInteractorProtocolMock()
    private var sut: RegisterViewController!

    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()

        // always use simulator for snapshot testing, advisable from iphone 7 higher
        record = SnapshotTestsRecordMode.environmentVariableMappingValue
        sut = createRegisterViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testNormal() {
        sut.assertSnapshots()
    }

    // Navigation Methods
    func testRegisterClicked() {
        sut.registerButtonTapped(UIButton())
        Verify(mockInteractor, .handleRegister(registerRequest: .any, profileImage: .any))
    }

    func testSkipButtonTapped() {
        sut.skipButtonTapped()
        Verify(mockRouter, .route(to: .value(.home)))
    }
    
    func testHaveAnAccountClicked() {
        sut.alreadyHaveAccountButtonTapped(UIButton())
        Verify(mockRouter, .route(to: .value(.login)))
    }

    // Methods
    func testDisplayLoginErrors() {
        let error = "error"
        sut.displayLoginError(error)
        Verify(mockAlertPresenter, .presentAlert(
            title: .value("Error Login"),
            description: .value(error),
            actions: .matching({
                let action = $0.first
                XCTAssert(action?.title == "Ok")
                return true
            })))
    }

    func testDisplayLoginSuccess() {
        sut.displayLoginSuccess()
        Verify(mockRouter, .route(to: .value(.home)))
    }

    func testRegisterError() {
        let title = "Registration Failed"
        let error = "error"
        sut.displayRegisterError(title, error)
        Verify(mockAlertPresenter, .presentAlert(
            title: .value(title),
            description: .value(error),
            actions: .matching({
                let action = $0.first
                XCTAssert(action?.title == "Ok")
                return true
            })))
    }

    func testDisplaySelectedImage() {
        let image = UIImage()
        sut.displaySelectedImage(image: image)
        XCTAssert(sut.profilePictureImageView.image == image)
    }

    // Display Fields Error
    func testDisplayEmptyEmail() {
        let error = DataValidationError.emptyEmail
        sut.displayFieldError(error)
        let isValid = self.isErrorDisplayed(for: error, and: sut.emailTextField)
    }

    func testDisplayInvalidEmail() {
        let error = DataValidationError.invalidEmail
        sut.displayFieldError(error)
        let isValid = self.isErrorDisplayed(for: error, and: sut.emailTextField)
        XCTAssert(isValid)
    }

    func testDisplayEmptyPassword() {
        let error = DataValidationError.emptyPassword
        sut.displayFieldError(error)
        let isValid = self.isErrorDisplayed(for: error, and: sut.passwordTextfield)
        XCTAssert(isValid)
    }

    func testDisplayInvalidPassword() {
        let error = DataValidationError.invalidPassword
        sut.displayFieldError(error)
        let isValid = self.isErrorDisplayed(for: error, and: sut.passwordTextfield)
        XCTAssert(isValid)
    }

    func testDisplayGeneric() {
        let error = DataValidationError.emptyFields
        sut.displayFieldError(error)

        let isValidEmail = self.isErrorDisplayed(for: error, and: sut.emailTextField)
        let isValidPassword = self.isErrorDisplayed(for: error, and: sut.passwordTextfield)
        let isValidName  = self.isErrorDisplayed(for: error, and: sut.nameTextfield)
        let isValidLastName  = self.isErrorDisplayed(for: error, and: sut.lastNameTextfield)
        let isValidConfirmPass  = self.isErrorDisplayed(for: error, and: sut.confirmPasswordTextfield)
        let isValid = isValidEmail && isValidPassword && isValidName && isValidLastName && isValidConfirmPass

        XCTAssert(isValid)
    }

    func testDisplayEmptyFirstName() {
        let error = DataValidationError.emptyFirstName
        sut.displayFieldError(error)
        let isValid = self.isErrorDisplayed(for: error, and: sut.nameTextfield)
        XCTAssert(isValid)
    }

    func testDisplayEmptyLastName() {
        let error = DataValidationError.emptyLastName
        sut.displayFieldError(error)
        let isValid = self.isErrorDisplayed(for: error, and: sut.lastNameTextfield)
        XCTAssert(isValid)
    }

    func testDisplayPasswordsDontMatch() {
        let error = DataValidationError.passwordsDontMatch
        sut.displayFieldError(error)
        let isValid = self.isErrorDisplayed(for: error, and: sut.confirmPasswordTextfield)
        XCTAssert(isValid)
    }

    func testDisplayEmptyConfirmPassword() {
        let error = DataValidationError.emptyConfirmPassword
        sut.displayFieldError(error)
        let isValid = self.isErrorDisplayed(for: error, and: sut.confirmPasswordTextfield)
        XCTAssert(isValid)
    }

    // resetErrors
    func testdidResetForEmailTextfield() {
        let error = DataValidationError.invalidEmail
        sut.displayFieldError(error)

        let isErrorShown = isErrorDisplayed(for: error, and: sut.emailTextField)
        XCTAssert(isErrorShown)

        sut.textFieldDidBeginEditing(sut.emailTextField)

        let didReset = !isErrorDisplayed(for: error, and: sut.emailTextField)
        XCTAssert(didReset)

    }

    func testdidResetForPasswordTextfield() {
        let error = DataValidationError.invalidPassword
        sut.displayFieldError(error)

        let isErrorShown = isErrorDisplayed(for: error, and: sut.passwordTextfield)
        XCTAssert(isErrorShown)

        sut.textFieldDidBeginEditing(sut.passwordTextfield)

        let didReset = !isErrorDisplayed(for: error, and: sut.passwordTextfield)
        XCTAssert(didReset)

    }

    func testdidResetForNameTextfield() {
        let error = DataValidationError.emptyFirstName
        sut.displayFieldError(error)

        let isErrorShown = isErrorDisplayed(for: error, and: sut.nameTextfield)
        XCTAssert(isErrorShown)

        sut.textFieldDidBeginEditing(sut.nameTextfield)

        let didReset = !isErrorDisplayed(for: error, and: sut.nameTextfield)
        XCTAssert(didReset)
    }

    func testdidResetForLastNameTextfield() {
        let error = DataValidationError.emptyLastName
        sut.displayFieldError(error)

        let isErrorShown = isErrorDisplayed(for: error, and: sut.lastNameTextfield)
        XCTAssert(isErrorShown)

        sut.textFieldDidBeginEditing(sut.lastNameTextfield)

        let didReset = !isErrorDisplayed(for: error, and: sut.lastNameTextfield)
        XCTAssert(didReset)
    }

    func testdidResetForConfirmPassTextfield() {
        let error = DataValidationError.passwordsDontMatch
        sut.displayFieldError(error)

        let isErrorShown = isErrorDisplayed(for: error, and: sut.confirmPasswordTextfield)
        XCTAssert(isErrorShown)

        sut.textFieldDidBeginEditing(sut.confirmPasswordTextfield)
        let didReset = !isErrorDisplayed(for: error, and: sut.confirmPasswordTextfield)
        XCTAssert(didReset)
    }
}

// MARK: Privates
private extension RegisterViewControllerTests {

    func createRegisterViewController() -> RegisterViewController {
         let vc = R.storyboard.register.registerViewController()!
         vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
         vc.set(router: mockRouter)
         vc.set(alert: mockAlertPresenter)
         vc.set(interactor: mockInteractor)
         vc.lifecycle()
         return vc
     }

    func isErrorDisplayed(for error: DataValidationError, and textfield: UITextField) -> Bool {

        guard sut.errorLabel.isHidden == false else { return false }
        guard sut.errorLabel.text == error.localizedDescription else { return false }
        guard textfield.textColor == R.color.appLightRed() else { return false }

        return true
    }
}
