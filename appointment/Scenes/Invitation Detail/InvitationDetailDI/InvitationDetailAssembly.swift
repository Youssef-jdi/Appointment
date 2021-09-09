//
//  InvitationDetailAssembly.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/5/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class InvitationDetailAssembly: Assembly {
    // swiftlint:disable:next function_body_length
    func assemble(container: Container) {
        
        // MARK: - Invitation Detail 
        container.register(InvitationDetailRouterProtocol.self) { resolver in
            let invitationDetailStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.invitationDetail.name)
            let invitationStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.invitation.name)
            let chatStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.chat.name)
            let popupStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.customPopUp.name)
            return InvitationDetailRouter(
                chatStoryboard: chatStoryboard,
                invitationStoryboard: invitationStoryboard,
                invitationDetailStoryboard: invitationDetailStoryboard,
                popupStoryboard: popupStoryboard
            )
        }

        container.autoregister(InvitationDetailInteractorProtocol.self, initializer: InvitationDetailInteractor.init)

        container.autoregister(InvitationDetailPresenterProtocol.self, initializer: InvitationDetailPresenter.init)

        container.autoregister(InvitationDetailDataSourceProtocol.self, initializer: InvitationDetailDataSource.init)

        container.storyboardInitCompleted(InvitationDetailViewController.self) { resolver, vc in
            let presenter = resolver ~> (InvitationDetailPresenterProtocol.self)
            let router = resolver ~> (InvitationDetailRouterProtocol.self)
            let interactor = resolver ~> (InvitationDetailInteractorProtocol.self)
            let dataSource = resolver ~> (InvitationDetailDataSourceProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(dataSource: dataSource)
        }
        
        // MARK: - New Invitation Detail
        
        container.register(NewInvitationDetailRouterProtocol.self) { resolver in
            let invitationDetailStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.invitationDetail.name)
            let invitationStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.invitation.name)
            let chatStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.chat.name)
            let popupStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.customPopUp.name)
            return NewInvitationDetailRouter(
                chatStoryboard: chatStoryboard,
                invitationStoryboard: invitationStoryboard,
                invitationDetailStoryboard: invitationDetailStoryboard,
                popupStoryboard: popupStoryboard
            )
        }
        
        container.autoregister(NewInvitationDetailInteractorProtocol.self, initializer: NewInvitationDetailInteractor.init)
        container.autoregister(NewInvitationDetailPresenterProtocol.self, initializer: NewInvitationDetailPresenter.init)
        container.autoregister(NewInvitationDetailDataSourceProtocol.self, initializer: NewInvitationDetailDataSource.init)

        container.storyboardInitCompleted(NewInvitationDetailViewController.self) { resolver, vc in
            let presenter = resolver ~> (NewInvitationDetailPresenterProtocol.self)
            let router = resolver ~> (NewInvitationDetailRouterProtocol.self)
            let interactor = resolver ~> (NewInvitationDetailInteractorProtocol.self)
            let dataSource = resolver ~> (NewInvitationDetailDataSourceProtocol.self)
            router.set(viewController: vc)
            presenter.set(viewController: vc)

            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(dataSource: dataSource)
        }

        // MARK: - Add Date
        container.register(AddDateInteractorProtocol.self) { resolver in
            let invitationDetailStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.invitationDetail.name)
            
            return AddDateInteractor(
                presenter: resolver ~> (AddDatePresenterProtocol.self),
                dateProvider: resolver ~> (DateProviderProtocol.self),
                calendar: resolver ~> (CalendarProtocol.self),
                appointmentDateApiService: resolver ~> (AppointmentDateApiServiceProtocol.self),
                errorHandler: resolver ~> (ErrorHandlerProtocol.self),
                alertPresenter: resolver ~> (AlertPresenterProtocol.self),
                invitationDetailStoryboard: invitationDetailStoryboard
            )
        }
        container.autoregister(AddDatePresenterProtocol.self, initializer: AddDatePresenter.init)
        container.autoregister(AddDateRouterProtocol.self, initializer: AddDateRouter.init)
        container.storyboardInitCompleted(AddDateViewController.self) { resolver, vc in
            let router = resolver ~> (AddDateRouterProtocol.self)
            let interactor = resolver ~> (AddDateInteractorProtocol.self)
            let presenter = resolver ~> (AddDatePresenterProtocol.self)
            vc.set(router: router)
            vc.set(interactor: interactor)
            presenter.set(viewController: vc)
            router.set(viewController: vc)
        }
        
        // MARK: - Day Calendar
        container.autoregister(DayCalendarInteractorProtocol.self, initializer: DayCalendarInteractor.init)
        container.register(NewInvitationDetailRouterProtocol.self) { resolver in
            let invitationDetailStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.invitationDetail.name)
            let invitationStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.invitation.name)
            let chatStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.chat.name)
            let popupStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.customPopUp.name)
            return NewInvitationDetailRouter(
                chatStoryboard: chatStoryboard,
                invitationStoryboard: invitationStoryboard,
                invitationDetailStoryboard: invitationDetailStoryboard,
                popupStoryboard: popupStoryboard
            )
        }
        container.autoregister(DayCalendarPresenterProtocol.self, initializer: DayCalendarPresenter.init)
        container.autoregister(DayCalendarDataSourceProtocol.self, initializer: DayCalendarDataSource.init)

        container.storyboardInitCompleted(DayCalendarViewController.self) { resolver, vc in
            let presenter = resolver ~> (DayCalendarPresenterProtocol.self)
            let interactor = resolver ~> (DayCalendarInteractorProtocol.self)
            let dataSource = resolver ~> (DayCalendarDataSourceProtocol.self)
            presenter.set(viewController: vc)

            vc.set(interactor: interactor)
            vc.set(dataSource: dataSource)
        }
        
        // MARK: - Select Date
        container.register(InvitationSelectDateRouterProtocol.self) { resolver in
            let popupStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.customPopUp.name)
            return InvitationSelectDateRouter(popupStoryboard: popupStoryboard)
        }

        container.autoregister(InvitationSelectDateInteractorProtocol.self, initializer: InvitationSelectDateInteractor.init)
        container.autoregister(InvitationSelectDatePresenterProtocol.self, initializer: InvitationSelectDatePresenter.init)
        container.autoregister(InvitationSelectDataSourceProtocol.self, initializer: InvitationSelectDataSource.init)

        container.storyboardInitCompleted(InvitationSelectDateViewController.self) { resolver, vc in
            let router = resolver ~> (InvitationSelectDateRouterProtocol.self)
            let interactor = resolver ~> (InvitationSelectDateInteractorProtocol.self)
            let presenter = resolver ~> (InvitationSelectDatePresenterProtocol.self)
            let dataSource = resolver ~> (InvitationSelectDataSourceProtocol.self)
            let viewModelProvider = resolver ~> (AppointmentViewModelProviderProtocol.self)
            vc.set(router: router)
            vc.set(interactor: interactor)
            vc.set(dataSource: dataSource)
            vc.set(appointmentDateViewModelProvider: viewModelProvider)

            presenter.set(viewController: vc)
            router.set(viewController: vc)
        }

        // MARK: Add To Agenda
        container.register(AddToAgendaRouterProtocol.self) { resolver in
            let rootNavigator = resolver ~> (RootNavigatorProtocol.self)
            let invitationStoryboard = resolver ~> (Storyboard.self, name: R.storyboard.invitationDetail.name)
            return AddToAgendaRouter(
                rootNavigator: rootNavigator,
                invitationDetailStoryboard: invitationStoryboard)
        }

        container.autoregister(AddToAgendaInteractorProtocol.self, initializer: AddToAgendaInteractor.init)
        container.autoregister(AddToAgendaPresenterProtocol.self, initializer: AddToAgendaPresenter.init)

        container.storyboardInitCompleted(AddToAgendaViewController.self) { resolver, vc in
            let router = resolver ~> (AddToAgendaRouterProtocol.self)
            let interactor = resolver ~> (AddToAgendaInteractorProtocol.self)
            let presenter = resolver ~> (AddToAgendaPresenterProtocol.self)

            vc.set(interactor: interactor)
            vc.set(router: router)

            router.set(viewController: vc)
            presenter.set(viewController: vc)
        }
    }
}
