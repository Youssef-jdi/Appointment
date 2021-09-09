//
//  AppointmentStatus.swift
//  appointment
//
//  Created by Raluca Mesterca on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum AppointmentStatus: String, Codable {
    case created
    case planned
    case cancelled
    case unknown
    case rejected // only for coredata
}
