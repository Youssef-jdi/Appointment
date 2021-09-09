//
//  HomeAssembly.swift
//  appointment
//
//  Created by Raluca Mesterca on 25/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

//swiftlint:disable implicit_return
class HomeAssembly: Assembly {
    func assemble(container: Container) {

        // MARK: Home DI
        container.register(HomeRouterProtocol.self) { resolver in
            return HomeRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                destinationStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name)
            )
        }

        container.autoregister(HomePresenterProtocol.self, initializer: HomePresenter.init)

        container.autoregister(HomeInteractorProtocol.self, initializer: HomeInteractor.init)

        container.storyboardInitCompleted(HomeViewController.self) { resolver, vc in
            let presenter = resolver ~> (HomePresenterProtocol.self)
            let router = resolver ~> (HomeRouterProtocol.self)
            let interactor = resolver ~> (HomeInteractorProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: interactor)
        }

        //Profile Service
        container.register(ProfileServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return ProfileService(client: MoyaClient<ProfileTarget>(authManager: authManager), authManager: authManager)
        }

        //Local User
        container.autoregister(LocalUserServiceProtocol.self, initializer: LocalUserService.init)
        // MARK: PAGE VIEW CONTROLLER
        container.autoregister(HomePagePresenterProtocol.self, initializer: HomePagePresenter.init)
        container.autoregister(HomePageInteractorProtocol.self, initializer: HomePageInteractor.init)

        container.storyboardInitCompleted(HomePageViewController.self) { resolver, vc in
            let presenter = resolver ~> (HomePagePresenterProtocol.self)
            presenter.set(viewController: vc)
            vc.set(interactor: resolver ~> (HomePageInteractorProtocol.self))
        }
    }
}
