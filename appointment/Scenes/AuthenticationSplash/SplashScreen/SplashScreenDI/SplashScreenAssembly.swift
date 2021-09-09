//
//  SplashScreenAssemby.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/20/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

//swiftlint:disable implicit_return
class SplashScreenAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: SplashScreen DI
        container.register(SplashScreenRouterProtocol.self) { resolver in
            return SplashScreenRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                loginStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.login.name),
                homeStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name)
            )
        }

        container.autoregister(SplashScreenInteractorProtocol.self, initializer: SplashScreenInteractor.init)
        container.autoregister(SplashScreenPresenterProtocol.self, initializer: SplashScreenPresenter.init)

        container.storyboardInitCompleted(SplashScreenViewController.self) { resolver, vc in
            let router = resolver ~> (SplashScreenRouterProtocol.self)
            let presenter = resolver ~> (SplashScreenPresenterProtocol.self)

            presenter.set(viewController: vc)
            router.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: resolver ~> (SplashScreenInteractorProtocol.self))
        }
    }
}
