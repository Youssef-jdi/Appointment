////
//  SideMenuRouter.swift
//  appointment
//
//  Created by Raluca Mesterca on 21/02/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit
import SideMenuSwift

//sourcery: AutoMockable
protocol SideMenuRouterProtocol {
    func set(viewController: SideMenuViewControllerProtocol?)

    func route(to scene: SideMenuRouter.Scene)
}

class SideMenuRouter: NSObject, SideMenuRouterProtocol {

    // MARK: DI
    weak var viewController: SideMenuViewControllerProtocol?
    weak var sideMenuController: SideMenuController?

    private let rootNavigator: RootNavigatorProtocol
    private let homeStoryboard: Storyboard
    private let invitationStoryboard: Storyboard
    private let settingsStoryboard: Storyboard

    func set(viewController: SideMenuViewControllerProtocol?) {
        self.viewController = viewController
    }

    init(
        rootNavigator: RootNavigatorProtocol,
        homeStoryboard: Storyboard, // agenda/timeline
        invitationStoryboard: Storyboard,
        settingsStoryboard: Storyboard
    ) {
        self.rootNavigator = rootNavigator
        self.homeStoryboard = homeStoryboard
        self.invitationStoryboard = invitationStoryboard
        self.settingsStoryboard = settingsStoryboard
    }
}

// MARK: Routing logic
extension SideMenuRouter {

    enum Scene: Int {
        case events
        case invitations
        case agenda
        case holidays
        case meetings
        case messages
        case minOfMeetings // M.O.M.
        case appointments
        case standard
        case business
        case group
        case memos
        case memo
        case memoTo
        case linkedWith
        case facebookLink
        case googleLink
        case outlookLink
        case contactsLink
        case yahooLink
        case settings
        case upgrades
        case about
    }

    func route(to scene: SideMenuRouter.Scene) {
        switch scene {
        case .invitations:
            let identifier = InvitationStoryboardId.invitation
            guard let vc = invitationStoryboard.viewController(identifier: identifier) as? InvitationContainerViewController else { return assertionFailure() }
            let navVC = ApplicationNavigationController(rootViewController: vc)
            rootNavigator.setSideMenuRoot(contentViewController: navVC)

        case .agenda: //this is home/timeline
            let identifier = HomeStoryboardId.home
            guard let vc = homeStoryboard.viewController(identifier: identifier) as? HomeViewController else { return assertionFailure() }
            rootNavigator.setSideMenuRoot(contentViewController: ApplicationNavigationController(rootViewController: vc))

        case .settings:
            let identifier = SettingsStoryboarddId.settings
            guard let vc = settingsStoryboard.viewController(identifier: identifier) as? SettingsViewController else { return assertionFailure() }

            let nav = ApplicationNavigationController(rootViewController: vc)
            rootNavigator.setSideMenuRoot(contentViewController: nav)

        default:
            Console.log(type: .error, "This scene was selected: \(scene)")
        }
    }
}
