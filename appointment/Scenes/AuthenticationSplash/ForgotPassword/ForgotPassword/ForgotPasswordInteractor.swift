//
//  ForgotPasswordInteractor.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/20/20.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit
import Moya

//sourcery: AutoMockable
protocol ForgotPasswordInteractorProtocol {
    func handleTextFieldChange(email: String?)
    func sendEmail(email: String?)
}

class ForgotPasswordInteractor: ForgotPasswordInteractorProtocol {

    // MARK: DI
    var presenter: ForgotPasswordPresenterProtocol
    
    private let dataValidator: DataValidatorProtocol
    private let forgotPasswordService: ForgotPasswordServiceProtocol

    init(
        presenter: ForgotPasswordPresenterProtocol,
        dataValidator: DataValidatorProtocol,
        forgotPasswordService: ForgotPasswordServiceProtocol
    ) {
        self.presenter = presenter
        self.dataValidator = dataValidator
        self.forgotPasswordService = forgotPasswordService
    }
    
    func handleTextFieldChange(email: String?) {
        do {
            try validateForgotPasswordData(email: email)
            handleValidationSuccess()
        } catch {
            guard let error = error as? DataValidationError else { return }
            handleValidationError(error)
        }
    }
    
    func sendEmail(email: String?) {
        guard let email = email else { return }
        forgotPasswordService.forgetPassword(email: email) { [weak self] result in
            switch result {
            case .success: self?.handleEmailSentSuccess()
            case .failure: self?.handleEmailSentError(.emailNotSent)
            }
        }
    }
}

extension ForgotPasswordInteractor {
    func validateForgotPasswordData(email: String?) throws {
        guard let email = email else { return }
        if email.isEmpty { throw DataValidationError.emptyEmail }
        try dataValidator.validateEmail(email)
    }
    
    func handleValidationError(_ error: DataValidationError) {
        presenter.presentValidationError(error)
    }
    
    func handleValidationSuccess() {
        presenter.presentValidationSuccess()
    }
    
    func handleEmailSentSuccess() {
        presenter.presentEmailSentSuccess()
    }
    
    func handleEmailSentError(_ error: ForgotPasswordError) {
        presenter.presentEmailSentError(error)
    }
}