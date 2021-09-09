//
//  LoginResponse.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let expiresIn: Int
    let tokenType: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case tokenType = "token_type"
    }
}
