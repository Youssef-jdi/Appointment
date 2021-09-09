//
//  UserResponseType.swift
//  appointment
//
//  Created by Raluca Mesterca on 06/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

/// Identifies the type of the user response to the appointment
/// in regard of adding it to the calendar.
enum UserResponseType: Int, Codable {
    case unknown
    /// A user wants the appointment to be added as Standard to their timeline.
    case standard
    /// A user wants the appointment to be added as Business to their timeline.
    case business
    /// A user wants the appointment to be added as Group to their timeline.
    case group
    /// A user does not want the appointment to be added to their timeline.
    case rejected
    /// *Default* state for an appointment when the user hasn't responded to it yet.
    case noResponse
}
