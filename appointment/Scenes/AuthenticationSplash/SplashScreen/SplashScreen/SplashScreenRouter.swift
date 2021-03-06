////
//  SplashScreenRouter.swift
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

//sourcery: AutoMockable
protocol SplashScreenRouterProtocol {
  func set(viewController: SplashScreenViewControllerProtocol?)
  func route(to scene: SplashScreenRouter.Scene)
}

class SplashScreenRouter: NSObject, SplashScreenRouterProtocol {

    // MARK: DI
    weak var viewController: SplashScreenViewControllerProtocol?
    private let rootNavigator: RootNavigatorProtocol
    private let loginStoryboard: Storyboard
    private let homeStoryboard: Storyboard

    func set(viewController: SplashScreenViewControllerProtocol?) {
        self.viewController = viewController
    }

    init(
        rootNavigator: RootNavigatorProtocol,
        loginStoryboard: Storyboard,
        homeStoryboard: Storyboard
    ) {
        self.rootNavigator = rootNavigator
        self.loginStoryboard = loginStoryboard
        self.homeStoryboard = homeStoryboard
    }
}

// MARK: Routing logic
extension SplashScreenRouter {

    enum Scene {
        case login
        case home
    }

    func route(to scene: SplashScreenRouter.Scene) {
        switch scene {
        case .login:
            guard let nav = loginStoryboard.initial() as? ApplicationNavigationController else { return }
            viewController?.present(nav, animated: true, completion: nil)

        case .home:
            let identifier = HomeStoryboardId.home
            guard let homeVC = homeStoryboard.viewController(identifier: identifier) as? HomeViewController else { return assertionFailure() }
            let navVC = ApplicationNavigationController(rootViewController: homeVC)
            rootNavigator.setSideMenuRoot(contentViewController: navVC)
        }
    }
}
