//
//  EventsService.swift
//  appointment
//
//  Created by Raluca Mesterca on 01/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import Moya

//sourcery: AutoMockable
protocol EventsServiceProtocol {
    func getEvents(_ completion: @escaping RequestCompletion<[AppEvent]>)
}

class EventsService: EventsServiceProtocol {

    private let client: MoyaClient<EventsTarget>
    private let authManager: AuthManagerProtocol
    private let unauthenticatedUserError =
        MoyaError.underlying(AuthError.unauthenticatedUser, nil)
    
    init(client: MoyaClient<EventsTarget>, authManager: AuthManagerProtocol) {
        self.client = client
        self.authManager = authManager
    }

    func getEvents(_ completion: @escaping RequestCompletion<[AppEvent]>) {
        authManager.isUserLoggedIn
        ? client.requestArray(.getEvents, completion)
        : completion(.failure(unauthenticatedUserError))
    }
}
