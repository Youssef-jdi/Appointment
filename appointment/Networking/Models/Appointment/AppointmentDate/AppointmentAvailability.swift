//
//  AppointmentAvailability.swift
//  appointment
//
//  Created by Jihen on 06/07/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
import CoreLocation

struct AppointmentAvailability: Codable {
    let appointmentId: Int
    let creatorId: Int
    let organiser: String
    let title: String
    let description: String
    let location: String?
    let longitude: Float?
    let latitude: Float?
    let participants: [Participant]?
    
    enum CodingKeys: String, CodingKey {
        case appointmentId = "appointment_id"
        case creatorId = "appointment_creator_id"
        case organiser = "appointment_organiser"
        case title = "appointment_title"
        case description = "appointment_description"
        case location = "appointment_location"
        case longitude = "appointment_lat"
        case latitude = "appointment_long"
        case participants = "appointment_participants"
    }
}

// MARK: Map from database entity
extension AppointmentAvailability {

}

extension AppointmentAvailability: Equatable {

    static func == (lhs: AppointmentAvailability, rhs: AppointmentAvailability) -> Bool {
        return lhs.appointmentId == rhs.appointmentId
    }
}

