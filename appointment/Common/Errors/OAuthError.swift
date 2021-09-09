//
//  OAuthError.swift
//  appointment
//
//  Created by Youssef Jdidi on 5/12/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import p2_OAuth2
import Moya

enum AuthError: AppError {
    case wrongCredentials
    case unauthenticatedUser

    var title: String {
        return "Oops!"
    }

    var localizedDescription: String {
        switch self {
        case .wrongCredentials:
            return R.string.localizable.wrongCredentials().capitalizingFirstLetter()
        case .unauthenticatedUser:
            return R.string.localizable.unauthenticatedUserError().capitalizingFirstLetter()
        }
    }

    // Returns the Moya Error localized description
    // or the unathenticated user localized description
    static func handleUnauthenticatedUser(from error: MoyaError) -> Error {
//        let localizedDescription = error.localizedDescription
        guard case let .underlying(err, nil) = error, let authError = err as? AuthError else {
                return error
            }

        return authError
//        return authError.localizedDescription
    }
}
