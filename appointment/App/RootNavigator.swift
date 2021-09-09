//
//  RootNavigator.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import SideMenuSwift

//sourcery: AutoMockable
protocol RootNavigatorProtocol {
    func setRootViewController()
    func setSideMenuRoot(contentViewController: UIViewController)
}

class RootNavigator: RootNavigatorProtocol {

    private var application: UIApplicationProtocol
    private let splashScreenStoryboard: Storyboard
    private let sideMenuStoryboard: Storyboard
    private let homeStoryboard: Storyboard

    init(
        application: UIApplicationProtocol,
        splashScreenStoryboard: Storyboard,
        sideMenuStoryboard: Storyboard,
        homeStoryboard: Storyboard
    ) {
        self.application = application
        self.splashScreenStoryboard = splashScreenStoryboard
        self.sideMenuStoryboard = sideMenuStoryboard
        self.homeStoryboard = homeStoryboard
    }
    
    func setRootViewController() {
        application.rootViewController = splashScreenStoryboard.initial()
    }

    func setSideMenuRoot(contentViewController: UIViewController) {
        application.rootViewController = SideMenuController(
            contentViewController: contentViewController,
            menuViewController: sideMenuStoryboard.initial()!
        )
        configureSideMenu()
    }

    func configureSideMenu() {
        SideMenuController.preferences.basic.menuWidth = 300
        SideMenuController.preferences.basic.position = .sideBySide
    }
}
