//
//  SettingsAssembly.swift
//  appointment
//
//  Created by Raluca Mesterca on 06/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class SettingsAssembly: Assembly {

    func assemble(container: Container) {

        container.register(SettingsRouterProtocol.self) { resolver in
            SettingsRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                loginStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.login.name),
                popupStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.customPopUp.name))
        }

        container.autoregister(SettingsInteractorProtocol.self, initializer: SettingsInteractor.init)

         container.autoregister(SettingsPresenterProtocol.self, initializer: SettingsPresenter.init)

        container.storyboardInitCompleted(SettingsViewController.self) { resolver, vc in

            let presenter = resolver ~> (SettingsPresenterProtocol.self)
            let router = resolver ~> (SettingsRouterProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)
            vc.set(router: router)
            vc.set(interactor: resolver ~> (SettingsInteractorProtocol.self))
        }
    }
}
