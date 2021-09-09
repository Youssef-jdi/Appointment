//
//  AppointmentParticipant.swift
//  appointment
//
//  Created by Raluca Mesterca on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum ParticipantStatus: String, Codable {
    case invited
    case owner
    case rejected
    case unknown
}

struct Participant: Codable {
    let id: Int
    let appointmentId: Int
    let firstName: String
    let lastName: String
    let image: String?
    let status: ParticipantStatus?
    let typeResponse: Int
    let isViewed: Int

    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case appointmentId = "appointment_id"
        case firstName = "user_first_name"
        case lastName = "user_last_name"
        case image = "image_url"
        case status
        case typeResponse = "user_response_type"
        case isViewed = "is_viewed"
    }

    var userResponseType: UserResponseType {
        return UserResponseType(rawValue: typeResponse) ?? .unknown
    }
}

// MARK: Map from database entity
extension Participant {

    static func map(from entity: ParticipantEntity?) -> Participant? {
        guard let entity = entity else { return nil }
        return Participant(
            id: Int(entity.id),
            appointmentId: Int(entity.appointmentId),
            firstName: entity.firstName ?? "",
            lastName: entity.lastName ?? "",
            image: entity.image,
            status: ParticipantStatus(rawValue: entity.status ?? "unknown"),
            typeResponse: Int(entity.typeResponse),
            isViewed: Int(entity.isViewed))
    }
}
