//
//  DataValidatorError.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/14/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum DataValidationError: AppError, Equatable {
    
    case invalidEmail
    case invalidPassword
    case usernameTooShort
    case invalidUsername
    
    case emptyFields
    case emptyEmail
    case emptyPassword
    case passwordsDontMatch
    case emptyFirstName
    case emptyLastName
    case emptyConfirmPassword
    
    var title: String { return "Oops" }
    
    var description: String {
        switch self {
        case .invalidEmail:
            return "This is not an email"
        case .invalidPassword:
            return "this is not a password"
        case .usernameTooShort:
            return ""
        case .invalidUsername:
            return ""
        case .emptyFields:
            return "Fields are empty"
        case .emptyEmail:
            return "email empty"
        case .emptyPassword:
            return "password empty"
        case .passwordsDontMatch:
            return "Passwords are not the same"
        case .emptyFirstName:
            return "first name is empty"
        case .emptyLastName:
            return "last name is empty"
        case .emptyConfirmPassword:
            return "confirm Password is empty"
        }
    }
}
