//
//  AppointmentOrigin.swift
//  appointment
//
//  Created by Raluca Mesterca on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum AppointmentOrigin: Int, Codable {
    case defaultOrigin = 1
    case appointment = 2
    case contacts = 3
    case google = 4
    case facebook = 5
    case yahoo = 6
    case outlook = 7
    case origin = 0 // To do: Rick said this case same as 1 
}
