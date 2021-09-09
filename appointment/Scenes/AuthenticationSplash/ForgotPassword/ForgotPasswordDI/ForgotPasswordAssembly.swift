//
//  ForgotPasswordAssembly.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/20/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class ForgotPasswordAssembly: Assembly {
    //swiftlint:disable implicit_return
    func assemble(container: Container) {
        // MARK: ForgotPassword DI
        container.register(ForgotPasswordRouterProtocol.self) {  resolver in
            return ForgotPasswordRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self) ,
                destinationStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.forgotPassword.name))
        }
        
        container.autoregister(ForgotPasswordPresenterProtocol.self, initializer: ForgotPasswordPresenter.init)
        
        container.register(ForgotPasswordServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return ForgotPasswordService(client: MoyaClient<ForgotPasswordTarget>(authManager: authManager))
        }
        
        container.register(ForgotPasswordInteractorProtocol.self) { resolver in
            return ForgotPasswordInteractor(
                presenter: resolver ~> (ForgotPasswordPresenterProtocol.self),
                dataValidator: resolver ~> (DataValidatorProtocol.self),
                forgotPasswordService: resolver ~> (ForgotPasswordServiceProtocol.self))
        }
        
        container.storyboardInitCompleted(ForgotPasswordViewController.self) { resolver, vc in
            let router = resolver ~> (ForgotPasswordRouterProtocol.self)
            let presenter = resolver ~> (ForgotPasswordPresenterProtocol.self)
            let interactor = resolver ~> (ForgotPasswordInteractorProtocol.self)
            let alertPresenter = resolver ~> (AlertPresenterProtocol.self)
            
            router.set(viewController: vc)
            presenter.set(viewController: vc)
            
            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(alertPresenter: alertPresenter)
        }
    }
}
