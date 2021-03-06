////
//  SyncRouter.swift
//  appointment
//
//  Created by Rachel Polachova on 05/03/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol SyncRouterProtocol {
  func set(viewController: SyncViewControllerProtocol?)
  func route(to scene: SyncRouter.Scene)
}

class SyncRouter: NSObject, SyncRouterProtocol {

    // MARK: DI
    weak var viewController: SyncViewControllerProtocol?
    private let rootNavigator: RootNavigatorProtocol
    private let homeStoryboard: Storyboard

    func set(viewController: SyncViewControllerProtocol?) {
        self.viewController = viewController
    }

    init(
        rootNavigator: RootNavigatorProtocol,
        homeStoryboard: Storyboard
    ) {
        self.rootNavigator = rootNavigator
        self.homeStoryboard = homeStoryboard
    }
}

// MARK: Routing logic
extension SyncRouter {

    enum Scene {
        case home
    }

    func route(to scene: SyncRouter.Scene) {
        switch scene {
        case .home:
            let identifier = HomeStoryboardId.home
            guard let homeVC = homeStoryboard.viewController(identifier: identifier) as? HomeViewController else { return assertionFailure() }
            let navVC = ApplicationNavigationController(rootViewController: homeVC)
            rootNavigator.setSideMenuRoot(contentViewController: navVC)
        }
    }
}
