//
//  ForgotPasswordViewControllerTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 07/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky
import SnapshotTesting

class ForgotPasswordViewControllerTests: XCTestCase {

    private let mockRouter = ForgotPasswordRouterProtocolMock()
    private let mockInteractor = ForgotPasswordInteractorProtocolMock()
    private let mockAlertPresenter = AlertPresenterProtocolMock()

    func testNormal() {
        let sut = createViewController()
        sut.assertSnapshots(named: "ForgotPasswordViewControllerTestsNormal")
    }

    func testErrorEmailNotSent() {
        let sut = createViewController()
        sut.displayEmailSentError(.emailNotSent)
        sut.assertSnapshots(named: "ForgotPasswordViewControllerTestsError")
    }

    func testDisplaySuccess() {
        let sut = createViewController()
        sut.displayEmailSentSuccess()
        Verify(mockAlertPresenter, .presentAlert(title: .value("Success"), description: .value("Email sent successfully"), actions: .any))
    }

    func testDisplayValidationError() {
        let sut = createViewController()
        sut.displayValidationError("Email does not exist.")
        sut.assertSnapshots(named: "ForgotPasswordViewControllerTestsError-EmailNotExist")
    }


    private func createViewController() ->  ForgotPasswordViewController {

        let vc = UIStoryboard(name: "ForgotPassword", bundle: nil).instantiateViewController(withIdentifier: R.storyboard.forgotPassword.forgotPasswordViewController.identifier) as! ForgotPasswordViewController
        vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
        vc.set(router: mockRouter)
        vc.set(interactor: mockInteractor)
        vc.set(alertPresenter: mockAlertPresenter)
        vc.lifecycle()
        return vc
    }
}
