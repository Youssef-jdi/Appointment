//
//  SideMenuInteractor.swift
//  appointment
//
//  Created by Raluca Mesterca on 21/02/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol SideMenuInteractorProtocol {
    func checkAuthRequired(for scene: SideMenuRouter.Scene)
    func handleViewWillAppear()
}

class SideMenuInteractor: SideMenuInteractorProtocol {

    // MARK: DI
    var presenter: SideMenuPresenterProtocol
    private let authManager: AuthManagerProtocol
    private let currentUserDataService: CurrentUserDataServiceProtocol
    private let eventsDataService: EventsDataServiceProtocol
    private let appointmentDataService: AppointmentDataServiceProtocol

    init(
        presenter: SideMenuPresenterProtocol,
        authManager: AuthManagerProtocol,
        currentUserDataService: CurrentUserDataServiceProtocol,
        eventsDataService: EventsDataServiceProtocol,
        appointmentDataService: AppointmentDataServiceProtocol
    ) {
        self.presenter = presenter
        self.authManager = authManager
        self.currentUserDataService = currentUserDataService
        self.eventsDataService = eventsDataService
        self.appointmentDataService = appointmentDataService
    }
}

extension SideMenuInteractor {

    func handleViewWillAppear() {
        guard authManager.isUserLoggedIn else {
            presenter.resetSubItemData()
            return
        }

        fetchUserFromLocal()
        getNotificationData()
    }

    func checkAuthRequired(for scene: SideMenuRouter.Scene) {
        switch scene {
        case .invitations:
            authManager.isUserLoggedIn
                ? presenter.handleRoutingEnabled(for: scene)
                : presenter.handleUserIsAnon(error: .authNeeded)
        default:
            presenter.handleRoutingEnabled(for: scene)
        }
    }

    func fetchUserFromLocal() {
        currentUserDataService.fetchCurrentUser { [weak self] result in
            switch result {
            case .success(let user):
                guard let user = user as? CurrentUserEntity else { return }
                let profile = UserProfile.map(from: user)
                self?.presenter.present(user: profile)
            case .failure(let error):
                self?.presenter.handle(error: error)
            }
        }
    }

    func getNotificationData() {
        appointmentDataService.fetchAppointments(appointmentId: nil) { [weak self] result in
            switch result {
            case .success(let appointments):
                Console.log(type: .success, "Appointments fetched successfully! Count: \(appointments.count)")
                let newAppointments = appointments
                    .compactMap { $0 as? AppointmentEntity }
                    .map { Appointment.map(from: $0) }
                self?.filter(appointments: newAppointments)

            case .failure(let error):
                self?.presenter.handle(error: error)
            }
        }
    }

    // TODO: clarify business logic to display side menu items count
    // right now iOS and Android values don't match
    func filter(appointments: [Appointment]) {
        // fetch all
        eventsDataService.fetchEvents(appointmentId: nil) { [weak self] result in
            switch result {
            case .success(let data):
                let events = data.compactMap { $0 as? EventEntity }
                let newEvents = events.map { AppEvent.map(from: $0) }.filter { $0.isRead }
                self?.presenter.present(events: newEvents)
                self?.presenter.present(appointmentData: appointments)

//                let appointmentIds = newEvents.map { $0.appointmentID }
//               // fitering appointments to only display those with appointments ids found in new events array
//                let newEventAppointments = appointments.filter { appointmentIds.contains($0.id) }
//                self?.presenter.present(appointmentData: newEventAppointments)

            case .failure(let error):
                self?.presenter.handle(error: error)
            }
        }
    }
}
