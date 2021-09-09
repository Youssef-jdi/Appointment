//
//  ForgotPasswordService.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/20/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol ForgotPasswordServiceProtocol {

    func forgetPassword(email: String, _ completion: @escaping RequestCompletion<ForgotPasswordResponse>)
}

class ForgotPasswordService: ForgotPasswordServiceProtocol {
    
    private let client: MoyaClient<ForgotPasswordTarget>
    
    init(client: MoyaClient<ForgotPasswordTarget>) {
        self.client = client
    }
    
    func forgetPassword(email: String, _ completion: @escaping RequestCompletion<ForgotPasswordResponse>) {
        client.request(.forgetPassword(email: email), completion)
    }
}
