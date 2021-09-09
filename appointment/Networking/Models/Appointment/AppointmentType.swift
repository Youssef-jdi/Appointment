//
//  AppointmentType.swift
//  appointment
//
//  Created by Raluca Mesterca on 19/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

/// only enum invite has categories
enum AppointmentType: String, Codable {
    case memoTo // post -it to
    case mom
    case memo // post-it
    case invite
    case chat
    case unknown

    /// Defines the priority with which an appointment is shown in home sceen
    /// in case of multiple appointments; Appointment Categories have greater prio
    static func > (lhs: AppointmentType, rhs: AppointmentType) -> Bool {
        switch (lhs, rhs) {
        case (.memoTo, _), (.mom, .mom), (.mom, .memo), (.memo, .memo): return true
        default: return false
        }
    }
}
