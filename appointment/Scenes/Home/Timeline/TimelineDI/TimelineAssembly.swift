//
//  TimelineAssembly.swift
//  appointment
//
//  Created by Raluca Mesterca on 18/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

//swiftlint:disable implicit_return
class TimelineAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Home DI
        container.register(TimelineRouterProtocol.self) { resolver in
            return TimelineRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                destinationStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.timeline.name)
            )
        }

        container.autoregister(TimelinePresenterProtocol.self, initializer: TimelinePresenter.init)

        container.autoregister(TimelineInteractorProtocol.self, initializer: TimelineInteractor.init)

        container.storyboardInitCompleted(TimelineViewController.self) { resolver, vc in
            let presenter = resolver ~> (TimelinePresenterProtocol.self)
            let router = resolver ~> (TimelineRouterProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: resolver ~> (TimelineInteractorProtocol.self))
        }
    }
}
