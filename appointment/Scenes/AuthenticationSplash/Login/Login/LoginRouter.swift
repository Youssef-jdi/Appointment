//
//  LoginRouter.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol LoginRouterProtocol {
    func set(viewController: LoginViewControllerProtocol)
    func route(to scene: LoginRouter.Scene)
}

class LoginRouter: NSObject, LoginRouterProtocol {
    weak var viewController: LoginViewControllerProtocol?
    private let rootNavigator: RootNavigatorProtocol

    private let loginStoryboard: Storyboard
    private let forgotPasswordStoryboard: Storyboard
    private let registerStoryboard: Storyboard
    private let homeStoryboard: Storyboard
    private let syncStoryboard: Storyboard

    init(
        rootNavigator: RootNavigatorProtocol,
        loginStoryboard: Storyboard,
        forgotPasswordStoryboard: Storyboard,
        registerStoryboard: Storyboard,
        homeStoryboard: Storyboard,
        syncStoryboard: Storyboard
        ) {
        self.rootNavigator = rootNavigator

        self.loginStoryboard = loginStoryboard
        self.forgotPasswordStoryboard = forgotPasswordStoryboard
        self.registerStoryboard = registerStoryboard

        self.homeStoryboard = homeStoryboard
        self.syncStoryboard = syncStoryboard
    }
    
    enum Scene: Equatable {
        case loginOverView
        case register
        case forgetPassword
        case home
        case sync
    }

    func set(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func route(to scene: LoginRouter.Scene) {
        switch scene {
        case .loginOverView:
            viewController?.popToRoot(animated: true)

        case .register:
            let identifier = RegisterStoryboardId.register
            guard let vc = registerStoryboard.viewController(identifier: identifier) as? RegisterViewController
                else { return }
            viewController?.show(vc, sender: nil)

        case .forgetPassword:
            let identifier = ForgotPasswordStoryboard.ForgotPasswordStoryboardId.forgotPassword
            guard let vc = forgotPasswordStoryboard.viewController(identifier: identifier) as? ForgotPasswordViewController
                else { return }
            viewController?.show(vc, sender: nil)

        case .home:
            let identifier = HomeStoryboardId.home
            guard let homeVC = homeStoryboard.viewController(identifier: identifier) as? HomeViewController else { return assertionFailure() }
            let navVC = ApplicationNavigationController(rootViewController: homeVC)
            rootNavigator.setSideMenuRoot(contentViewController: navVC)
            
        case .sync:
            let identifier = SyncStoryboard.SyncStoryboardId.sync
            guard let syncVC = syncStoryboard.viewController(identifier: identifier) as? SyncViewController else { return assertionFailure() }
            
            viewController?.show(syncVC, sender: nil)
        }
    }
}
