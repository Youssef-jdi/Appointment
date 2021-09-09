//
//  SideMenuAssembly.swift
//  appointment
//
//  Created by Raluca Mesterca on 25/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import SideMenuSwift

//swiftlint:disable implicit_return
class SideMenuAssembly: Assembly {
    func assemble(container: Container) {

        // MARK: Side Menu DI
        container.register(SideMenuRouterProtocol.self) { resolver in
            return SideMenuRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                homeStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name),
                invitationStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.invitation.name),
                settingsStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.settings.name)
            )
        }

        container.autoregister(SideMenuPresenterProtocol.self, initializer: SideMenuPresenter.init)

        container.autoregister(SideMenuInteractorProtocol.self, initializer: SideMenuInteractor.init)

        container.storyboardInitCompleted(SideMenuViewController.self) { resolver, vc in
            let presenter = resolver ~> (SideMenuPresenterProtocol.self)
            let router = resolver ~> (SideMenuRouterProtocol.self)
            let alertPresenter = resolver ~> (AlertPresenterProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: resolver ~> (SideMenuInteractorProtocol.self))
            vc.set(alertPresenter: alertPresenter)
        }
    }
}
