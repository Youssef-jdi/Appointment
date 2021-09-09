//
//  AppointmentProposedDate.swift
//  appointment
//
//  Created by Jihen on 24/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

import UIKit
import CoreLocation

struct AppointmentProposedDate: Codable, Equatable {
    let id: Int
    let appointmentId: Int
    let creatorId: Int
    let start: Int64 // unix time in ms
    let end: Int64 // unix time in ms
    let isApproved: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case appointmentId = "appointment_id"
        case creatorId = "proposal_creator"
        case start = "proposal_start_date"
        case end = "proposal_end_date"
        case isApproved = "is_approved"
    }

    var startDate: Date {
        let date = Date(timeIntervalSince1970: TimeInterval(start)/1000)
        return date
    }
    
    var endDate: Date {
        let date = Date(timeIntervalSince1970: TimeInterval(end)/1000)
        return date
    }
}

// MARK: Map from database entity
extension AppointmentProposedDate {

    static func map(from entity: ProposedDateEntity?) -> AppointmentProposedDate? {
        guard let entity = entity else { return nil }

        return AppointmentProposedDate(
            id: Int(entity.id),
            appointmentId: Int(entity.appointmentId),
            creatorId: Int(entity.creatorId),
            start: Int64(entity.start),
            end: Int64(entity.end),
            isApproved: Int(entity.isApproved))
    }
}
