////
//  SettingsRouter.swift
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
protocol SettingsRouterProtocol {
  func set(viewController: SettingsViewControllerProtocol?)
  func route(to scene: SettingsRouter.Scene)
}

class SettingsRouter: NSObject, SettingsRouterProtocol {

    // MARK: DI
    weak var viewController: SettingsViewControllerProtocol?
    private let rootNavigator: RootNavigatorProtocol
    private let loginStoryboard: Storyboard
    private let popupStoryboard: Storyboard

    func set(viewController: SettingsViewControllerProtocol?) {
        self.viewController = viewController
    }

    init(
        rootNavigator: RootNavigatorProtocol,
        loginStoryboard: Storyboard,
        popupStoryboard: Storyboard
    ) {
        self.rootNavigator = rootNavigator
        self.loginStoryboard = loginStoryboard
        self.popupStoryboard = popupStoryboard
    }
}

// MARK: Routing logic
extension SettingsRouter {

    enum Scene {
        case loginOverview
        case logoutPopup(delegate: CustomPopupWithTwoButtonsDelegate, email: String)
    }

    func route(to scene: SettingsRouter.Scene) {
        switch scene {
        case .loginOverview:
            guard let vc = loginStoryboard.initial() else { return }
            viewController?.show(vc, sender: nil)
        case .logoutPopup(let delegate, let email):
            guard let vc = popupStoryboard.viewController(identifier: CustomPopUpStoryboardId.twoButton) as? CustomPopupWithTwoButtonsViewController else { return }
            vc.set(delegate: delegate)
            vc.set(popupType: .logoutPopup(email: email))
            viewController?.present(vc, animated: true, completion: nil)
        }
    }
}