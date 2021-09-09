//
//  InvitationService.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/25/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

//sourcery: AutoMockable
protocol InvitationServiceProtocol {
    func getInvitations(_ completion: @escaping RequestCompletion<[Appointment]>)
    func cancelAsCreator(invitationId: Int, _ completion: @escaping RequestCompletion<Void>)
    func cancelAsInvitee(invitationId: Int, _ completion: @escaping RequestCompletion<Void>)
}

class InvitationService: InvitationServiceProtocol {
    
    private let client: MoyaClient<AppointmentTarget>
    private let authManager: AuthManagerProtocol

    init(client: MoyaClient<AppointmentTarget>, authManager: AuthManagerProtocol) {
        self.client = client
        self.authManager = authManager
    }
    
    func getInvitations(_ completion: @escaping RequestCompletion<[Appointment]>) {
        client.requestArray(.getAppointments, completion)
    }

    func cancelAsCreator(invitationId: Int, _ completion: @escaping RequestCompletion<Void>) {
        client.requestWithNoResponse(.cancelAppointment(id: invitationId), completion)
    }

    func cancelAsInvitee(invitationId: Int, _ completion: @escaping RequestCompletion<Void>) {
        client.requestWithNoResponse(.rejectInvitation(id: invitationId), completion)
    }
}
