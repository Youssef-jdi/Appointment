//
//  InComingInteractor.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol InComingInteractorProtocol {
    func getInvitations()
}

class InComingInteractor: InComingInteractorProtocol {

    // MARK: - DI
    private let presenter: InComingPresenterProtocol
    private let invitationService: InvitationServiceProtocol
    private let currentUserService: CurrentUserDataServiceProtocol
    private let errorHandler: ErrorHandlerProtocol

    init(
        presenter: InComingPresenterProtocol,
        invitationService: InvitationServiceProtocol,
        errorHandler: ErrorHandlerProtocol,
        currentUserService: CurrentUserDataServiceProtocol
    ) {
        self.presenter = presenter
        self.invitationService = invitationService
        self.currentUserService = currentUserService
        self.errorHandler = errorHandler
    }
}

extension InComingInteractor {
    func getInvitations() {
        presenter.presentLoadingView(display: true)
        invitationService.getInvitations { [weak self] result in
            self?.presenter.presentLoadingView(display: false)
            switch result {
            case .success(let response):
                self?.filterIncomingInvitations(appointments: response)
            case .failure(let error):
                self?.errorHandler.handle(error)
            }
        }
    }

    private func filterIncomingInvitations(appointments: [Appointment]) {
        getCurrentUser {[weak self] userId in
            guard let self = self,
                let userId = userId else { return }
            let incomingInvitations = appointments.filter { $0.creatorId != userId && $0.appointmentType == .invite }
            self.presenter.present(incomingDataSource: incomingInvitations)
        }
    }

    private func getCurrentUser(_ completion: @escaping (Int?) -> Void) {
        currentUserService.fetchCurrentUser { result in
            switch result {
            case .success(let user):
                guard let user = user as? CurrentUserEntity else { return }
                let profile = UserProfile.map(from: user)
                completion(profile.userId)
            case .failure(let error): print("error fetching current user", error)
            }
        }
    }
}
