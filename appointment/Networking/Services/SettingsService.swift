//
//  SettingsService.swift
//  appointment
//
//  Created by Raluca Mesterca on 02/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import Moya

//sourcery: AutoMockable
protocol SettingsServiceProtocol {
    var isUserLoggedIn: Bool { get }
    func getSettings(_ completion: @escaping RequestCompletion<Settings>)
    func updateSettings(settings: Settings, _ completion: @escaping RequestCompletion<Settings>)
}

class SettingsService: SettingsServiceProtocol {

    private let client: MoyaClient<SettingsTarget>
    private let authManager: AuthManagerProtocol
    private let unauthenticatedUserError =
        MoyaError.underlying(AuthError.unauthenticatedUser, nil)

    private(set) var isUserLoggedIn: Bool

    init(client: MoyaClient<SettingsTarget>, authManager: AuthManagerProtocol) {
        self.client = client
        self.authManager = authManager
        isUserLoggedIn = authManager.isUserLoggedIn
    }

    func getSettings(_ completion: @escaping RequestCompletion<Settings>) {
        authManager.isUserLoggedIn
            ? client.request(.getSettings, completion)
            : completion(.failure(unauthenticatedUserError))
    }

    func updateSettings(settings: Settings, _ completion: @escaping RequestCompletion<Settings>) {
        authManager.isUserLoggedIn
            ? client.request(.updateSettings(settings: settings), completion)
            : completion(.failure(unauthenticatedUserError))
    }
}
