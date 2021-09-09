//
//  DataValidator.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/14/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol DataValidatorProtocol {
    func validateEmail(_ value: String?) throws
    func validatePassword(_ value: String?) throws
    func validatePasswordsMatch(_ password: String?, _ confirmPassword: String?) throws
}

class DataValidator: DataValidatorProtocol {

    func validateEmail(_ value: String?) throws {
        let emailFirstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let emailServerpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = emailFirstpart + "@" + emailServerpart + "[A-Za-z]{2,6}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        guard emailTest.evaluate(with: value) else {
            throw DataValidationError.invalidEmail
        }
    }
    
//    func validatePassword(_ value: String?) throws {
//        guard let value = value, value.count >= 8 else { throw DataValidationError.invalidPassword }
//        let uppercaseChars = CharacterSet.uppercaseLetters
//        let lowercaseChars = CharacterSet.lowercaseLetters
//        let digitChars = CharacterSet.decimalDigits
//
//        if value.rangeOfCharacter(from: uppercaseChars)?.isEmpty ?? true {
//            throw DataValidationError.invalidPassword
//        }
//
//        if value.rangeOfCharacter(from: lowercaseChars)?.isEmpty ?? true {
//            throw DataValidationError.invalidPassword
//        }
//
//        if value.rangeOfCharacter(from: digitChars)?.isEmpty ?? true {
//            throw DataValidationError.invalidPassword
//        }
//    }

    /*
     NOTE -
     changing the validation requirements for password
     so I can use the account: lonelyguy@lonely.nl qwerty
     it has a lot of appointments, custom timeline upgrades and other useful data
     */
    func validatePassword(_ value: String?) throws {
        guard let value = value else { throw DataValidationError.invalidPassword }
        let lowercaseChars = CharacterSet.lowercaseLetters

        if value.rangeOfCharacter(from: lowercaseChars)?.isEmpty ?? true {
            throw DataValidationError.invalidPassword
        }
    }
    
    func validatePasswordsMatch(_ password: String?, _ confirmPassword: String?) throws {
        guard password == confirmPassword else {
            throw DataValidationError.passwordsDontMatch
        }
    }
}
