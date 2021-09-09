//
//  SyncAssembly.swift
//  appointment
//
//  Created by Rachel Polachova on 05/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import FBSDKLoginKit

//swiftlint:disable implicit_return
class SyncAssembly: Assembly {
    func assemble(container: Container) {
        
        // MARK: Sync DI
        container.register(SyncRouterProtocol.self) { resolver in
            return SyncRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                homeStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name)
            )
        }
        
        container.autoregister(LoginManager.self, initializer: LoginManager.init)
        container.autoregister(GoogleServiceProtocol.self, initializer: GoogleService.init)
        container.register(OutlookServiceProtocol.self) { _ in
            return OutlookService.shared()
        }
        container.register(YahooServiceProtocol.self) { _ in
            return YahooService.shared
        }
        
        container.autoregister(SyncServiceProtocol.self, initializer: SyncService.init)
        
        container.storyboardInitCompleted(SyncViewController.self) { resolver, vc in
            let router = resolver ~> (SyncRouterProtocol.self)
            let interactor = resolver ~> (SyncInteractorProtocol.self)
            let presenter = resolver ~> (SyncPresenterProtocol.self)
            let alertPresenter = resolver ~> (AlertPresenterProtocol.self)
            
            router.set(viewController: vc)
            presenter.set(viewController: vc)
            
            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(alertPresenter: alertPresenter)
        }
        
        container.autoregister(SyncPresenterProtocol.self, initializer: SyncPresenter.init)
        container.register(SyncInteractorProtocol.self) { resolver in
            let presenter = resolver ~> (SyncPresenterProtocol.self)
            let service = resolver ~> (SyncServiceProtocol.self)
            return SyncInteractor(
                presenter: presenter,
                service: service
            )
        }
        
        container.register(SyncServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return SyncService(
                facebookManager: resolver ~> (LoginManager.self),
                outlookService: resolver ~> (OutlookServiceProtocol.self),
                yahooService: resolver ~> (YahooServiceProtocol.self),
                googleService: resolver ~> (GoogleServiceProtocol.self),
                client: MoyaClient<SyncTarget>(authManager: authManager),
                authManager: authManager
            )
        }
    }
}
