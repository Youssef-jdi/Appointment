////
//  TimelineWeeklyRouter.swift
//  appointment
//
//  Created by Raluca Mesterca on 18/03/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

protocol TimelineRouterProtocol {
  func set(viewController: TimelineViewControllerProtocol?)
  func route(to scene: TimelineRouter.Scene)
}

class TimelineRouter: NSObject, TimelineRouterProtocol {

    // MARK: DI
    weak var viewController: TimelineViewControllerProtocol?
    private let rootNavigator: RootNavigatorProtocol
    private let destinationStoryboard: Storyboard

    func set(viewController: TimelineViewControllerProtocol?) {
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
extension TimelineRouter {

    enum Scene {
        case destination1
    }

    func route(to scene: TimelineRouter.Scene) {
        switch scene {
        case .destination1:
            // TODO: Implement routing
            break
        }
    }
}
