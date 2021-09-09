//
//  RegisterResponse.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/18/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

// MARK: - RegisterResponse
//struct RegisterResponse: Codable {
//    let status: Int
//    let message: String
//    let registerResult: RegisterResult
//
//    enum CodingKeys: String, CodingKey {
//        case status, message
//        case registerResult = "result"
//    }
//}

// MARK: - Result
struct RegisterResponse: Codable {
    let success: Bool
}

//struct AddSocialMediaResponse: Codable {
//    let status: Int?
//    let message: String?
//    let result: AddSocialMediaResult?
//
    struct AddSocialMediaResponse: Codable {
        let message: String?
    }
//}
