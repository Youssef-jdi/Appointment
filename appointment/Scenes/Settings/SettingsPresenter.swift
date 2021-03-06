//
//  SettingsPresenter.swift
//  appointment
//
//  Created by Raluca Mesterca on 06/05/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol SettingsPresenterProtocol {
    func set(viewController: SettingsViewControllerProtocol?)

    func presentData(authenticatedUserStatus: Bool)
    func present(settings: Settings)
    func presentLogout()
    func presentUserToLogout(email: String)
}

class SettingsPresenter: SettingsPresenterProtocol {

    // MARK: DI
    weak var viewController: SettingsViewControllerProtocol?

    func set(viewController: SettingsViewControllerProtocol?) {
        self.viewController = viewController
    }
}

// MARK: Methods
extension  SettingsPresenter {

    func presentData(authenticatedUserStatus: Bool) {
        viewController?.displayData(authenticatedUserStatus: authenticatedUserStatus)
    }

    func present(settings: Settings) {
        viewController?.display(settings: settings)
    }

    func presentLogout() {
        viewController?.displayLogout()
    }

    func presentUserToLogout(email: String) {
        viewController?.displayLogoutPopout(email: email)
    }
}
