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
    
    var localizedDescription: String {
        switch self {
        case .invalidEmail:
            return "This email is invalid. Please try again."
        case .invalidPassword:
            return "Password must be at least 8 characters, it must contain at least one lowercase letter, one uppercase letter and one numeric digit."
        case .usernameTooShort:
            return "User name is invalid."
        case .invalidUsername:
            return "User name is invalid."
        case .emptyFields:
            return "Fields are empty"
        case .emptyEmail:
            return "You must fill a valid email address."
        case .emptyPassword:
            return "You must fill in a password with a minimum of 6 characters."
        case .passwordsDontMatch:
            return "The passwords don't match."
        case .emptyFirstName:
            return "First name is empty."
        case .emptyLastName:
            return "Last name is empty."
        case .emptyConfirmPassword:
            return "Confirm Password is empty."
        }
    }
}
