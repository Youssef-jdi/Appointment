//
//  ForgotPasswordError.swift
//  appointment
//
//  Created by Youssef Jdidi on 4/14/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum ForgotPasswordError: AppError {
    case emailNotSent

    var title: String {
        switch self {
        case .emailNotSent: return "Oops"
        }
    }

    var localizedDescription: String {
        switch self {
        case .emailNotSent: return "Email couldn't be sent. Please try later."
        }
    }
}
