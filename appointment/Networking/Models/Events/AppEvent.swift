//
//  AppEvent.swift
//  appointment
//
//  Created by Raluca Mesterca on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct AppEvent: Codable {
    let appointmentID: Int
    let text: String
    let type: Int
    let dateTime: Int
    let relation: EventRelation?
    let isRead: Bool

    enum CodingKeys: String, CodingKey {
        case appointmentID = "appointment_id"
        case text, type, relation
        case dateTime = "datetime"
        case isRead = "is_read"
    }

    var eventType: EventType {
        return EventType(rawValue: type) ?? .unknown
    }
}

// MARK: Map from database entity
extension AppEvent {

    static func map(from entity: EventEntity) -> AppEvent {
        return AppEvent(
            appointmentID: Int(entity.appointmentId),
            text: entity.text ?? "",
            type: Int(entity.type),
            dateTime: Int(entity.dateTime),
            relation: EventRelation(rawValue: Int(entity.relation)),
            isRead: entity.isRead)
    }
}

extension AppEvent: Equatable {

    static func == (lhs: AppEvent, rhs: AppEvent) -> Bool {
        return lhs.appointmentID == rhs.appointmentID
            && lhs.dateTime == rhs.dateTime
    }
}
