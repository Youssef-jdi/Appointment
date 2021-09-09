//
//  TutorialAssembly.swift
//  appointment
//
//  Created by Rachel Polachova on 21/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

// swiftlint:disable implicit_return
import Swinject
import SwinjectAutoregistration

class TutorialAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Tutorial DI

        container.autoregister(TutorialPresenterProtocol.self, initializer: TutorialPresenter.init)

        container.autoregister(TutorialInteractorProtocol.self, initializer: TutorialInteractor.init)
        
        container.register(TutorialRouterProtocol.self) { resolver in
            return TutorialRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                destinationStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name)
            )
        }
        
        container.register(TutorialInteractorProtocol.self) { resolver in
            return TutorialInteractor(
                presenter: resolver ~> (TutorialPresenterProtocol.self),
                service: resolver ~> (TutorialServiceProtocol.self)
            )
        }
        
        container.storyboardInitCompleted(TutorialViewController.self) { resolver, vc in
            let presenter = resolver ~> (TutorialPresenterProtocol.self)
            let interactor = resolver ~> (TutorialInteractorProtocol.self)
            let router = resolver ~> (TutorialRouterProtocol.self)
            presenter.set(viewController: vc)
            vc.set(interactor: interactor)
            vc.set(router: router)
        }
        
        // MARK: Tutorial Service
        
        container.register(TutorialServiceProtocol.self) { resolver in
            let authMangaer = resolver ~> (AuthManagerProtocol.self)
            return TutorialService(client: MoyaClient<TutorialTarget>(authManager: authMangaer))
        }
    }
}
