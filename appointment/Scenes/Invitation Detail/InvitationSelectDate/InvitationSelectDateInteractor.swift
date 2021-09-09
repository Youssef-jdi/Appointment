//
//  InvitationSelectDateInteractor.swift
//  appointment
//
//  Created by Tran Gia Huy on 11/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol InvitationSelectDateInteractorProtocol {
    func setFinalDate(date: AppointmentDate)
}

class InvitationSelectDateInteractor: InvitationSelectDateInteractorProtocol {
    private let presenter: InvitationSelectDatePresenterProtocol
    private let appointmentService: AppointmentDateApiServiceProtocol
    private let errorHandler: ErrorHandlerProtocol

    init(
        presenter: InvitationSelectDatePresenterProtocol,
        appointmentService: AppointmentDateApiServiceProtocol,
        errorHandler: ErrorHandlerProtocol
    ) {
        self.presenter = presenter
        self.appointmentService = appointmentService
        self.errorHandler = errorHandler
    }

    func setFinalDate(date: AppointmentDate) {
        guard let id = date.id, let appointmentId = date.appointmentId else { return }
        appointmentService.selectFinalDay(appointmentDateId: id, appointmentId: appointmentId) {[weak self] result in
            guard let self = self else { assertionFailure(); return }
            switch result {
                case .success:
                    self.presenter.presentSetFinalDateSuccess(
                        .init(
                            id: date.id,
                            appointmentId: date.appointmentId,
                            appointmentTitle:
                            date.appointmentTitle,
                            date: date.date,
                            appointmentLocation: date.appointmentLocation,
                            startTime: date.startTime,
                            endTime: date.endTime,
                            isFinal: 1,
                            responseCount:
                            date.responseCount,
                            hasUsers: date.hasUsers
                        )
                )
                case .failure(let error):
                    self.errorHandler.handle(error)
            }
        }
    }
}
