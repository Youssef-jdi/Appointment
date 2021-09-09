//
//  AppointmentCategory.swift
//  appointment
//
//  Created by Raluca Mesterca on 19/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import UIKit

enum AppointmentCategory: String, Codable {
    case business
    case standard
    case group
    case memo = "MEMO"
    case unknown

    enum CodingKeys: String, CodingKey {
        case standard, group, business
        case memo = "MEMO"
    }

    var image: UIImage? {
        switch self {
        case .memo:
            return R.image.memo_Icon_Yellow()
        case .standard:
            return R.image.popUp_invitation_incoming_appointment()
        case .group:
            return R.image.popUp_dateConfirmation()
        case .business:
            return R.image.menu_Business()
        case .unknown:
            return nil
        }
    }

    /// Defines the priority with which an appointment is shown in home sceen
    /// in case of multiple appointments
    static func > (lhs: AppointmentCategory, rhs: AppointmentCategory) -> Bool {
        switch (lhs, rhs) {
        case (.business, _),

             (.standard, .standard),
             (.standard, .group),
             (.standard, .memo),

             (.group, .group),
             (.group, .memo),

             (.memo, .memo): return true

        default:
            return false
        }
    }
}
