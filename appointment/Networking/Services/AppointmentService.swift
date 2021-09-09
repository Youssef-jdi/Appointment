//
//  AppointmentService.swift
//  appointment
//
//  Created by Raluca Mesterca on 01/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import Moya

//sourcery: AutoMockable
protocol AppointmentServiceProtocol {
    func getAppointments(_ completion: @escaping RequestCompletion<[Appointment]>)
    /// Adds the appointment with the specified ID to the user calendar (as a type specified
    /// with the status, or sets the appointment as not displayable in the calendar.
    func setCalendar(
        for appointmentId: Int,
        with status: UserResponseType,
        _ completion: @escaping RequestCompletion<Void>
    )
}

class AppointmentService: AppointmentServiceProtocol {

    private let client: MoyaClient<AppointmentTarget>
    private let authManager: AuthManagerProtocol
    private let unauthenticatedUserError = MoyaError.underlying(AuthError.unauthenticatedUser, nil)

    init(client: MoyaClient<AppointmentTarget>, authManager: AuthManagerProtocol) {
        self.client = client
        self.authManager = authManager
    }

    func getAppointments(_ completion: @escaping RequestCompletion<[Appointment]>) {
        authManager.isUserLoggedIn
            ? client.requestArray(.getAppointments, completion)
            : completion(.failure(unauthenticatedUserError))
    }
    
    func setCalendar(
        for appointmentId: Int,
        with status: UserResponseType,
        _ completion: @escaping RequestCompletion<Void>) {
        authManager.isUserLoggedIn
            ? client.requestWithNoResponse(
                .setCalendarStatus(appointmentId, status.rawValue),
                completion
            )
            : completion(.failure(unauthenticatedUserError))
    }

}
