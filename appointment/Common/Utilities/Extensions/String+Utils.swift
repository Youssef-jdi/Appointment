//
//  String + EmptyOrNil.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/21/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {

    var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
}

extension String {

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

extension String {

    var wrappedBool: Bool {
        guard let value = Int(self) else { assertionFailure(); return false }
        return value == 1
    }
}

extension Bool {

    var wrappedBool: String {
        return self ? "1" : "0" // https://imgflip.com/i/440p5r 🙄
    }
}
