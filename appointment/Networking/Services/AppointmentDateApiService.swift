//
//  AppointmentDateApiService.swift
//  appointment
//
//  Created by Jihen Ben Sassi on 02/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import Moya

//sourcery: AutoMockable
protocol AppointmentDateApiServiceProtocol {
    func selectFinalDay(appointmentDateId: Int, appointmentId: Int, _ completion: @escaping RequestCompletion<Appointment>)
    
    func addSuggestedDate(for appointmentId: Int, start: Int, end: Int, _ completion: @escaping RequestCompletion<AppointmentDateResponse>)
    
    func getProposedDates(appointmentId: Int, _ completion: @escaping RequestCompletion<[AppointmentProposedDate]>)
    
    func getDates(
        for id: Int,
        _ completion: @escaping RequestCompletion<[AppointmentDate]>
    )
    
    func respondToProposedDates(appointmentId: Int,
                                proposeDateId: Int,
                                status: Int,
                                _ completion: @escaping RequestCompletion<[AppointmentProposedDate]>)
    
    func setAvailability(appointmentId: Int,
                         appointmentDateId: Int,
                         comment: String,
                         availability: AvailabilityTypeModel,
                         _ completion: @escaping RequestCompletion<AppointmentAvailability>
    )
}

class AppointmentDateApiService: AppointmentDateApiServiceProtocol {
    
    private let client: MoyaClient<AppointmentDateTarget>
    private let authManager: AuthManagerProtocol
    private let unauthenticatedUserError = MoyaError.underlying(AuthError.unauthenticatedUser, nil)
    
    init(client: MoyaClient<AppointmentDateTarget>, authManager: AuthManagerProtocol) {
        self.client = client
        self.authManager = authManager
    }
    
    func selectFinalDay(appointmentDateId: Int, appointmentId: Int, _ completion:  @escaping RequestCompletion<Appointment>) {
        authManager.isUserLoggedIn ?
            client.request(.selectFinalDay(appointmentId: appointmentId, appointmentDateId: appointmentDateId), completion) : completion(.failure(unauthenticatedUserError))
    }
    
    func addSuggestedDate(for appointmentId: Int, start: Int, end: Int, _ completion: @escaping RequestCompletion<AppointmentDateResponse>) {
        authManager.isUserLoggedIn ?
            client.request(
                .addSuggested(
                    date: AddDate(
                        appointmentId: appointmentId,
                        suggestedDates: .init(
                            suggestedDate: .init(
                                startTime: String(start),
                                endTime: String(end),
                                isFinal: "0")))),
                completion) :
            completion(.failure(unauthenticatedUserError))
    }
    
    func getProposedDates(appointmentId: Int, _ completion: @escaping RequestCompletion<[AppointmentProposedDate]>) {
        authManager.isUserLoggedIn ?
            client.request(.getProposedDates(appointmentId: appointmentId), completion) : completion(.failure(unauthenticatedUserError))
    }
    
    func respondToProposedDates(appointmentId: Int,
                                proposeDateId: Int,
                                status: Int,
                                _ completion: @escaping RequestCompletion<[AppointmentProposedDate]>) {
        authManager.isUserLoggedIn ?
            client.request(.getProposedDates(appointmentId: appointmentId), completion) : completion(.failure(unauthenticatedUserError))
    }
    
    // TODO: Fix the response decoding
    func getDates(
        for id: Int,
        _ completion: @escaping RequestCompletion<[AppointmentDate]>
    ) {
//        authManager.isUserLoggedIn ?
//            client.request(.getDates(for: id), completion) :
//            completion(.failure(unauthenticatedUserError))
    }
    
    func setAvailability(appointmentId: Int,
                         appointmentDateId: Int,
                         comment: String,
                         availability: AvailabilityTypeModel,
                         _ completion: @escaping RequestCompletion<AppointmentAvailability>) {
        authManager.isUserLoggedIn ?
            client.request(.setAvailability(appointmentId: appointmentId,
                                            appointmentDateId: appointmentDateId,
                                            comment: comment,
                                            availability: availability.rawValue), completion) : completion(.failure(unauthenticatedUserError))
    }
}
