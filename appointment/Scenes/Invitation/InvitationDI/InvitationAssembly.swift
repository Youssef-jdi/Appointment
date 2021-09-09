//
//  InvitationAssembly.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

//swiftlint:disable implicit_return
//swiftlint:disable function_body_length
class InvitationAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: Invitation DI
//        container.register(InvitationRouterProtocol.self) { resolver in
//            return InvitationRouter(
//                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
//                addPopUpStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.customPopUp.name))
//        }

//        container.storyboardInitCompleted(InvitationViewController.self) { resolver, vc in
//            let router = resolver ~> (InvitationRouterProtocol.self)
//            router.set(viewController: vc)
//            vc.set(router: router)
//        }
        
        // MARK: Pager DI
        container.storyboardInitCompleted(InvitationPageController.self) { resolver, vc in
            vc.invitationStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.invitation.name)
        }

        // MARK: CurrentUserService
        container.register(CurrentUserDataServiceProtocol.self) { resolver in
            let coreDataController = resolver ~> (CoreDataControllerProtocol.self)
            return CurrentUserDataService(coreDataController: coreDataController)
        }
        
        // MARK: AppointmentDateApiService
        container.register(AppointmentDateApiService.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return AppointmentDateApiService(
                client: MoyaClient<AppointmentDateTarget>(authManager: authManager),
                authManager: authManager)
        }
        
        // MARK: Outgoing DI
        container.register(OutGoingRouterProtocol.self) { resolver in
            return OutGoingRouter(invitationDetailStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.invitationDetail.name))
        }

        container.autoregister(OutGoingPresenterProtocol.self, initializer: OutGoingPresenter.init)

        container.autoregister(OutGoingInteractorProtocol.self, initializer: OutGoingInteractor.init)

        container.storyboardInitCompleted(OutGoingViewController.self) { resolver, vc in
            let presenter = resolver ~> (OutGoingPresenterProtocol.self)
            let router = resolver ~> (OutGoingRouterProtocol.self)
            let interactor = resolver ~> (OutGoingInteractorProtocol.self)
            let dataSource = resolver ~> (InvitationDataSourceProtocol.self)
            
            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(dataSource: dataSource)
        }
        
        // MARK: Incoming DI
        container.register(InComingRouterProtocol.self) { resolver in
            return InComingRouter(
                invitationDetailStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.invitationDetail.name))
        }

        container.autoregister(InComingPresenterProtocol.self, initializer: InComingPresenter.init)
        container.autoregister(InComingInteractorProtocol.self, initializer: InComingInteractor.init)
        
        container.autoregister(InvitationDataSourceProtocol.self, initializer: InvitationDataSource.init)

        container.storyboardInitCompleted(InComingViewController.self) { resolver, vc in
            let presenter = resolver ~> (InComingPresenterProtocol.self)
            let router = resolver ~> (InComingRouterProtocol.self)
            let interactor = resolver ~> (InComingInteractorProtocol.self)
            let dataSource = resolver ~> (InvitationDataSourceProtocol.self)
            
            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(dataSource: dataSource)
        }

        // MARK: Invitation Container
        container.register(InvitationContainerInteractorProtocol.self) { resolver in
            let presenter = resolver ~> (InvitationContainerPresenterProtocol.self)
            return InvitationContainerInteractor(presenter: presenter)
        }
        container.register(InvitationContainerPresenterProtocol.self) {
            return InvitationContainerPresenter(invitationStoryboard: $0 ~> (Storyboard.self, name: R.storyboard.invitation.name))
        }
        container.register(InvitationContainerRouterProtocol.self) {
            return InvitationContainerRouter(addPopUpStoryboard: $0 ~> (Storyboard.self, name: R.storyboard.customPopUp.name))
        }
        container.storyboardInitCompleted(InvitationContainerViewController.self) { resolver, vc in
            let interactor = resolver ~> (InvitationContainerInteractorProtocol.self)
            let presenter = resolver ~> (InvitationContainerPresenterProtocol.self)
            let router = resolver ~> (InvitationContainerRouterProtocol.self)
            vc.set(interactor: interactor)
            vc.set(router: router)
            router.set(viewController: vc)
            presenter.set(viewController: vc)
        }

        // MARK: Availability Overview
        container.autoregister(AvailabilityOverviewInteractorProtocol.self, initializer: AvailabilityOverviewInteractor.init)
        container.autoregister(AvailabilityOverviewPresenterProtocol.self, initializer: AvailabilityOverviewPresenter.init)
        container.autoregister(AvailabilityOverviewRouterProtocol.self, initializer: AvailabilityOverviewRouter.init)
        container.storyboardInitCompleted(AvailabilityOverviewViewController.self) { resolver, vc in
            let interactor = resolver ~> (AvailabilityOverviewInteractorProtocol.self)
            let router = resolver ~> (AvailabilityOverviewRouterProtocol.self)
            vc.set(interactor: interactor)
            vc.set(router: router)
            router.set(viewController: vc)
        }
        
        // MARK: SetAvailability
        container.autoregister(SetAvailabilityInteractorProtocol.self, initializer: SetAvailabilityInteractor.init)
        container.autoregister(SetAvailabilityPresenterProtocol.self, initializer: SetAvailabilityPresenter.init)
        container.autoregister(SetAvailabilityRouterProtocol.self, initializer: SetAvailabilityRouter.init)

        container.storyboardInitCompleted(SetAvailabilityViewController.self) { resolver, vc in
            let presenter = resolver ~> (SetAvailabilityPresenterProtocol.self)
            let interactor = resolver ~> (SetAvailabilityInteractorProtocol.self)
            let router = resolver ~> (SetAvailabilityRouterProtocol.self)
            
            vc.set(interactor: interactor)
            vc.set(router: router)
            router.set(viewController: vc)
            presenter.set(viewController: vc)
        }

    }
}
