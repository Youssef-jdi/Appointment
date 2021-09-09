////
//  HomeRouter.swift
//  appointment
//
//  Created by Raluca Mesterca on 25/02/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit
import SideMenuSwift

protocol HomeRouterProtocol {
  func set(viewController: HomeViewControllerProtocol?)
  func route(to scene: HomeRouter.Scene)
}

class HomeRouter: NSObject, HomeRouterProtocol {

    // MARK: DI
    weak var viewController: HomeViewControllerProtocol?
    private let rootNavigator: RootNavigatorProtocol
    private let destinationStoryboard: Storyboard

    func set(viewController: HomeViewControllerProtocol?) {
        self.viewController = viewController
    }

    init(
        rootNavigator: RootNavigatorProtocol,
        destinationStoryboard: Storyboard
    ) {
        self.rootNavigator = rootNavigator
        self.destinationStoryboard = destinationStoryboard
    }
}

// MARK: Routing logic
extension HomeRouter {

    enum Scene {
        case someDestination
    }

    func route(to scene: HomeRouter.Scene) {
        switch scene {
        default: break
        }
    }
}