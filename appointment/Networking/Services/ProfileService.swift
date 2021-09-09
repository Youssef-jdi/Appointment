//
//  ProfileService.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/26/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

//sourcery: AutoMockable
protocol UserProfileServiceProtocol {
    /// Gets the user profile data if the user is logged in
    /// Otherwise, returns unauthenticated user error
    func getProfile(_ completion: @escaping  RequestCompletion<UserProfile>)
}

class UserProfileService: UserProfileServiceProtocol {
    
    private let client: MoyaClient<UserProfileTarget>
    private let authManager: AuthManagerProtocol
    private let unauthenticatedUserError =
        MoyaError.underlying(AuthError.unauthenticatedUser, nil)
    
    init(client: MoyaClient<UserProfileTarget>, authManager: AuthManagerProtocol) {
        self.client = client
        self.authManager = authManager
    }

    func getProfile(_ completion: @escaping RequestCompletion<UserProfile>) {
        authManager.isUserLoggedIn
        ? client.request(.getProfile, completion)
        : completion(.failure(unauthenticatedUserError))
    }
}
