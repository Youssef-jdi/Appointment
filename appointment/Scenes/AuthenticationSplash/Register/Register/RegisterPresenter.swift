//
//  RegisterPresenter.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/17/20.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit
import Moya
import p2_OAuth2

//sourcery: AutoMockable
protocol RegisterPresenterProtocol {
    func set(viewController: RegisterViewControllerProtocol?)

    func presentInvalidData(_ error: DataValidationError)
    func presentRegisterError(_ error: MoyaError)
    func presentLoginError(_ error: OAuth2Error)
    func presentLoginSuccess()

    func presentSelectedImage(image: UIImage)
}

class RegisterPresenter: RegisterPresenterProtocol {

    // MARK: DI
    weak var viewController: RegisterViewControllerProtocol?

    func set(viewController: RegisterViewControllerProtocol?) {
        self.viewController = viewController
    }
}

// MARK: Methods
extension  RegisterPresenter {
    
    func presentInvalidData(_ error: DataValidationError) {
        viewController?.displayFieldError(error)
    }
    
    func presentRegisterError(_ error: MoyaError) {
        switch error.response?.statusCode {
        case 409:
            viewController?.displayRegisterError(
                RegisterError.emailAlreadyExists.title,
                RegisterError.emailAlreadyExists.localizedDescription)

        default:
            viewController?.displayRegisterError(
                RegisterError.other(error).title,
                RegisterError.other(error).localizedDescription)
        }
    }
    
    func presentLoginSuccess() {
        viewController?.displayLoginSuccess()
    }
    
    func presentLoginError(_ error: OAuth2Error) {
        viewController?.displayLoginError(error.description)
    }
    
    func presentSelectedImage(image: UIImage) {
        viewController?.displaySelectedImage(image: image)
    }
}
