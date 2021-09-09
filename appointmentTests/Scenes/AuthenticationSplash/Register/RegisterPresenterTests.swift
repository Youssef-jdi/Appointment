//
//  RegisterPresenterTests.swift
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
import Moya

class RegisterPresenterTests: XCTestCase {

    // MARK: Subject under test
    private let mockViewController = RegisterViewControllerProtocolMock()
    private var sut: RegisterPresenter!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        sut = createRegisterPresenter()
        sut.set(viewController: mockViewController)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testPresentSelectedImage() {
        guard let image = R.image.add_Icon() else {
            XCTFail("Image is nil")
            return
        }
        
        sut.presentSelectedImage(image: image)
        Verify(mockViewController, .displaySelectedImage(image: .any))
    }
    
    func testPresentLoginError() {
        sut.presentLoginError(.forbidden)
        Verify(mockViewController, .displayLoginError(.any))
    }
    
    func testPresentFieldError() {
        let error = DataValidationError.invalidUsername
        sut.presentInvalidData(error)
        Verify(mockViewController, .displayFieldError(.value(error)))
    }
    
    func testPresentRegisterError() {
        sut.presentRegisterError(.requestMapping(""))
        Verify(mockViewController, .displayRegisterError(.any, .any))
    }

    func testPresentEmailAlreadyUsed() {
        let error: MoyaError = .statusCode(.init(statusCode: 409, data: Data()))
        sut.presentRegisterError(error)
        Verify(mockViewController, .displayRegisterError(
            .matching{ $0 == RegisterError.emailAlreadyExists.title
            }, .matching{ $0 == RegisterError.emailAlreadyExists.localizedDescription }))
    }

    func testPresentLoginSuccess() {
        sut.presentLoginSuccess()
        Verify(mockViewController, .displayLoginSuccess())
    }
}

// MARK: - Privates
private extension RegisterPresenterTests {

    func createRegisterPresenter() -> RegisterPresenter {
        let presenter = RegisterPresenter()
        presenter.set(viewController: mockViewController)
        return presenter
    }
}
