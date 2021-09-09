//
//  SplashScreenInteractor.swift
//  appointment
//
//  Created by Raluca Mesterca on 16/04/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

protocol SplashScreenInteractorProtocol {
    func handleAnimationFinished()
}

class SplashScreenInteractor: SplashScreenInteractorProtocol {

    // MARK: DI
    var presenter: SplashScreenPresenterProtocol
    var authManager: AuthManagerProtocol

    init(
        presenter: SplashScreenPresenterProtocol,
        authManager: AuthManagerProtocol
    ) {
        self.presenter = presenter
        self.authManager = authManager
    }

    func handleAnimationFinished() {
//        authManager.logout()
        presenter.present(isUserLoggedIn: authManager.isUserLoggedIn)
    }
}
