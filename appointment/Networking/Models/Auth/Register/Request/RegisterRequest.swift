//
//  RegisterRequest.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/19/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct RegisterRequest: Encodable, Equatable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let confirmPassword: String
    
    let function: String?
    let kvk: String?
    let address: String?
    let postCode: String?
    
    let pushToken: String = "test"
    let userType: Int = 3
        
    enum CodingKeys: String, CodingKey {
        case email, password, function, kvk, address
        case firstName = "first_name"
        case lastName = "last_name"
        case postCode = "zip_code_city"
        case pushToken = "push_token"
        case userType = "user_type"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(function, forKey: .function)
        try container.encode(kvk, forKey: .kvk)
        try container.encode(address, forKey: .address)
        try container.encode(postCode, forKey: .postCode)
        try container.encode(pushToken, forKey: .pushToken)
        try container.encode(userType, forKey: .userType)
    }
}
