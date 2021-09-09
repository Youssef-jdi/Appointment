//
//  LoginAssembly.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class LoginAssembly: Assembly {
    //swiftlint:disable implicit_return
    func assemble(container: Container) {

        // MARK: LoginOverview DI
        container.register(LoginOverviewRouterProtocol.self) { resolver in
            return LoginOverviewRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                loginStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.login.name),
                registerStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.register.name),
                tutorialStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.tutorial.name)
            )
        }

        container.storyboardInitCompleted(LoginOverviewViewController.self) { resolver, vc in
            let router = resolver ~> (LoginOverviewRouterProtocol.self)
            router.set(viewController: vc)

            vc.set(router: router)
        }

        // MARK: Login DI
        container.register(LoginRouterProtocol.self) { resolver in

            return LoginRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                loginStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.login.name),
                forgotPasswordStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.forgotPassword.name),
                registerStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.register.name),
                homeStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name),
                syncStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.sync.name)
            )
        }

        container.autoregister(LoginPresenterProtocol.self, initializer: LoginPresenter.init)
        container.autoregister(LoginInteractorProtocol.self, initializer: LoginInteractor.init)

        container.storyboardInitCompleted(LoginViewController.self) { resolver, vc in
            let presenter = resolver ~> (LoginPresenterProtocol.self)
            let router = resolver ~> (LoginRouterProtocol.self)
            let interactor = resolver ~> (LoginInteractorProtocol.self)
            let alertPresenter = resolver ~> (AlertPresenterProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(alertPresenter: alertPresenter)
        }
    }
}
