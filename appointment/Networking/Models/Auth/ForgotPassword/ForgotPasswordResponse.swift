//
//  ForgotPasswordResponse.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/20/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//struct ForgotPasswordResponse: Codable {
//    let status: Int
//    let message: String
//    let forgotResult: ForgotResult
//
//    enum CodingKeys: String, CodingKey {
//        case status, message
//        case forgotResult = "result"
//    }
//}

// MARK: - Result
struct ForgotPasswordResponse: Codable {
    let message: String
}
