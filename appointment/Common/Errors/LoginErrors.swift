//
//  AuthErrors.swift
//  Zodify
//
//  Created by Tiziano Coroneo on 02/01/2019.
//  Copyright © 2019 DTT Multimedia. All rights reserved.
//

import Foundation

enum LoginError: LocalizedError, Hashable {
    case emptyEmail
    case emptyPassword
    case emptyRePassword
    case emptyFields

    case emailAndPasswordDontMatch
    case emailNotRegistered
    case emailAddressIsAlreadyTaken

    case mustAcceptTermsAndConditions
    
    case emptyName
    case emptySurname

    case emptyUsername
    case usernameTooLong
    case usernameCannotContainSymbols

    case emailNotValid

    case passwordTooShort
    case passwordMustContainOneUppercase
    case passwordMustContainOneLowercase
    case passwordMustContainOneDigit
    case passwordDontMatch
    
    case emptyFunction
    case emptyKvk
    case emptyAddress
    case emptyPostal

    var errorDescription: String? {
        return localizedDescription
    }

    var localizedDescription: String {
        switch self {
        case .emptyFields:
            return R.string.localizable.emptyFields()
        case .emptyEmail:
            return R.string.localizable.emptyEmail()
        case .emptyPassword:
            return R.string.localizable.emptyPassword()
        case .emptyRePassword:
            return R.string.localizable.emptyRePassword()

        case .emailAndPasswordDontMatch:
            return R.string.localizable.emailAndPasswordDontMatch()
        case .emailNotRegistered:
            return R.string.localizable.emailNotRegistered()
        case .emailAddressIsAlreadyTaken:
            return R.string.localizable.emailAddressIsAlreadyTaken()
        case .mustAcceptTermsAndConditions:
            return R.string.localizable.mustAcceptTermsAndConditions()
        case .passwordDontMatch:
            return R.string.localizable.passwordDontMatch()

        case .emptyUsername:
            return R.string.localizable.emptyUsername()
        case .usernameTooLong:
            return R.string.localizable.usernameTooLong()
        case .usernameCannotContainSymbols:
            return R.string.localizable.usernameCannotContainSymbols()

        case .passwordTooShort:
            return R.string.localizable.passwordTooShort()
        case .passwordMustContainOneLowercase:
            return R.string.localizable.passwordMustContainOneLowercase()
        case .passwordMustContainOneUppercase:
            return R.string.localizable.passwordMustContainOneUppercase()
        case .passwordMustContainOneDigit:
            return R.string.localizable.passwordMustContainOneDigit()
        case .emailNotValid:
            return R.string.localizable.emailNotValid()
        case .emptyName:
            return R.string.localizable.emptyName()
        case .emptySurname:
            return R.string.localizable.emptySurname()
            
        case .emptyFunction:
            return R.string.localizable.emptyFunction()
        case .emptyKvk:
            return R.string.localizable.kvkEmpty()
        case .emptyAddress:
            return R.string.localizable.emptyAddress()
        case .emptyPostal:
            return R.string.localizable.emptyPostal()
        }
    }
}

//let noResponseFromServerError = GenericError(
//    withMessage: "Oops! Something went wrong when communicating with the server.")
//let badRequestError = GenericError(
//    withMessage: "Bad Request: The server could not understand the request due to invalid syntax.")
