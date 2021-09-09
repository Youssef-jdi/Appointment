//
//  RegisterAssembly.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/17/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class RegisterAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: Register DI
        container.register(RegisterRouterProtocol.self) { resolver in
            RegisterRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                registerStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.register.name),
                loginStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.login.name),
                homeStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name)
            )
        }
        
        container.autoregister(RegisterPresenterProtocol.self, initializer: RegisterPresenter.init)
        
        container.register(RegisterInteractorProtocol.self) { resolver in
            RegisterInteractor(
                presenter: resolver ~> (RegisterPresenterProtocol.self),
                dataValidator: resolver ~> (DataValidatorProtocol.self),
                registerService: resolver ~> (RegisterServiceProtocol.self),
                authManager: resolver ~> (AuthManagerProtocol.self))
        }
        
        container.storyboardInitCompleted(RegisterViewController.self) { resolver, vc in
            let presenter = resolver ~> (RegisterPresenterProtocol.self)
            let interactor = resolver ~> (RegisterInteractorProtocol.self)
            let router = resolver ~> (RegisterRouterProtocol.self)
            let alert = resolver ~> (AlertPresenterProtocol.self)
            
            router.set(viewController: vc)
            presenter.set(viewController: vc)
            
            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(alert: alert)
        }
        
        // MARK: Register Service
        container.register(RegisterServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return RegisterService(client: MoyaClient<RegisterTarget>(authManager: authManager),
                                   authManager: authManager)
        }
    }
}
