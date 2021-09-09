//
//  RegisterService.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/18/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
import Moya

//sourcery: AutoMockable
protocol RegisterServiceProtocol {
    func register(registerRequest: RegisterRequest, profileImage: UIImage?, _ completion: @escaping RequestCompletion<RegisterResponse>)
}

class RegisterService: RegisterServiceProtocol {
    
    private let client: MoyaClient<RegisterTarget>
    private let authManager: AuthManagerProtocol
    
    init(client: MoyaClient<RegisterTarget>, authManager: AuthManagerProtocol) {
        self.client = client
        self.authManager = authManager
    }
    
    func register(registerRequest: RegisterRequest, profileImage: UIImage?, _ completion: @escaping RequestCompletion<RegisterResponse>) {
        client.request(.register(registerRequest: registerRequest,
                                 profileImage: profileImage), completion)
    }
}
