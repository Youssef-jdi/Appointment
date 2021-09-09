//
//  RegisterError.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya
//swiftlint: disable implicit_return
enum RegisterError: Error {
    case emailAlreadyExists
    case other(Error)
    
    var localizedDescription: String {
        switch self {
        case .emailAlreadyExists:
            return "This mail is already taken"
        case .other(let error):
            return error.localizedDescription
        }
    }
    
    var title: String {
        return "Registration Failed"
    }
}
