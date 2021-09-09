//
//  LoginViewControllerTests.swift
//  appointmentTests
//
//  Created by Raluca Mesterca on 18/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import XCTest
import SwiftyMocky
import SnapshotTesting

@testable import appointment
class LoginViewControllerTests: XCTestCase {

    // MARK: Mocks
    private let mockRouter = LoginRouterProtocolMock()
    private let mockInteractor = LoginInteractorProtocolMock()
    private let mockAlertPresenter = AlertPresenterProtocolMock()
    private var sut: LoginViewController!

    // MARK: Setup/Teardown
    override func setUp() {
        super.setUp()

        // always use simulator for snapshot testing, advisable from iphone 7 higher
        record = SnapshotTestsRecordMode.environmentVariableMappingValue
        sut = createViewController()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    // MARK: Tests
    func testNormal() {
        sut.assertSnapshots()
    }

    // Navigation Methods
    func testLoginTapped() {
        sut.emailTextField.text = "email@email.com"
        sut.passwordTextField.text = "Password123"
        sut.loginButtonTapped(sut!)
        Verify(mockInteractor, .validateFields(email: "email@email.com", password: "Password123"))
    }

    func testRegisterTapped() {
        sut.registerButtonTapped(sut!)
        Verify(mockRouter, .route(to: .value(.register)))
    }

    func testForgetPasswordTapped() {
        sut.forgotPasswordButtonTapped(sut!)
        Verify(mockRouter, .route(to: .value(.forgetPassword)))
    }

    func testSkipButtonTapped() {
        sut.skipButtonTapped()
        Verify(mockRouter, .route(to: .value(.home)))
    }

    // Methods
    func testDisplayGenericError() {
        let errorMessage = "generic"
        sut.displayGeneric(error: errorMessage)
        let errorLabelEqual = errorShownCorrectly(with: errorMessage)
        XCTAssertTrue(errorLabelEqual, "displayGeneric(error:) should show the error label with message")
    }
    
    func testDisplayInvalidPasswordError() {
        let errorMessage = "password"
        sut.displayInvalidPassword(error: errorMessage)
        let errorLabelEqual = errorShownCorrectly(with: errorMessage)
        let textColorEqual = sut.passwordTextField.textColor == UIColor.systemPink
        XCTAssertTrue(errorLabelEqual && textColorEqual, "displayInvalidPassword(error:) should show error label with message and change view of passwordTextField")
    }
    
    func testDisplayInvalidEmailError() {
        let errorMessage = "email"
        sut.displayInvalidEmail(error: errorMessage)
        let errorLabelEqual = errorShownCorrectly(with: errorMessage)
        let textColorEqual = sut.emailTextField.textColor == UIColor.systemPink
        XCTAssertTrue(errorLabelEqual && textColorEqual, "displayInvalidEmail(error:) should show error label with message and change view of emailTextField")
    }
    
    func testFailedLogin() {
        let errorMessage = "error"
        sut.handleLoginFailure(error: errorMessage)
        Verify(mockAlertPresenter, .presentAlert(title: .any, description: .any, actions: .any))
    }
    
    func testSuccessLogin() {
        sut.handleLoginSuccess()
        Verify(mockRouter, .route(to: .value(.sync)))
    }
}

// MARK: Privates
private extension LoginViewControllerTests {

    func createViewController() -> LoginViewController {
        let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: R.storyboard.login.loginViewController.identifier) as! LoginViewController

        vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
        vc.set(router: mockRouter)
        vc.set(interactor: mockInteractor)
        vc.set(alertPresenter: mockAlertPresenter)

        vc.lifecycle()
        return vc
    }
    
    func errorShownCorrectly(with errorMessage: String) -> Bool {
        let errorLabelShown = sut.errorLabel.isHidden == false
        let errorLabelMessageEqual = sut.errorLabel.text == errorMessage
        return errorLabelShown && errorLabelMessageEqual
    }
}
