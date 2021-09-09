//
//  SideMenuPresenter.swift
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

//sourcery: AutoMockable
protocol SideMenuPresenterProtocol {
    func set(viewController: SideMenuViewControllerProtocol?)

    func present(user: UserProfile)
    func present(events: [AppEvent])
    func present(appointmentData: [Appointment])

    func resetSubItemData()

    func handleRoutingEnabled(for scene: SideMenuRouter.Scene)
    func handleUserIsAnon(error: SideMenuError)

    func handle(error: Error)
}

class SideMenuPresenter: SideMenuPresenterProtocol {

    // MARK: DI
    weak var viewController: SideMenuViewControllerProtocol?

    func set(viewController: SideMenuViewControllerProtocol?) {
        self.viewController = viewController
    }
}

// MARK: Methods
extension  SideMenuPresenter {

    func present(user: UserProfile) {
        viewController?.display(user: user)
    }

    func present(events: [AppEvent]) {
        viewController?.display(events: events)
    }

    func present(appointmentData: [Appointment]) {
        viewController?.display(appointmentData: appointmentData)
    }

    func handleRoutingEnabled(for scene: SideMenuRouter.Scene) {
        viewController?.handleRoutingEnabled(for: scene)
    }
    
    func handleUserIsAnon(error: SideMenuError) {
        viewController?.handleUserIsAnon(error)
    }

    func handle(error: Error) {
        viewController?.display(error: error)
    }

    func resetSubItemData() {
        viewController?.resetSubItemData()
    }
}
