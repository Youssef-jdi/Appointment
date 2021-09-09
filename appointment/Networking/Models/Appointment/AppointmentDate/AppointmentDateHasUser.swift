//
//  AppointmentDateHasUser.swift
//  appointment
//
//  Created by Raluca Mesterca on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

// Naming is terrible, but keeping API convention
struct AppointmentDateHasUser: Codable, Equatable {
    let userID: Int
    let userName: String
    let lastName: String
    let email: String
    let imageURL: String?
    let appointmentDateID: Int
    let comment: String?
    let repliedOn: Int
    let availability: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case userName = "user_name"
        case lastName = "last_name"
        case email
        case imageURL = "image_url"
        case appointmentDateID = "appointment_date_id"
        case comment
        case repliedOn = "replied_on"
        case availability
    }
}

// MARK: Map from database entity
extension AppointmentDateHasUser {

    static func map(from entity: ApppointmentDateUsersEntity?) -> AppointmentDateHasUser? {
        guard let entity = entity else { return nil }
        return AppointmentDateHasUser(
            userID: Int(entity.userId),
            userName: entity.username ?? "",
            lastName: entity.lastName ?? "",
            email: entity.email ?? "",
            imageURL: entity.imageURL,
            appointmentDateID: Int(entity.appointmentDateID),
            comment: entity.comment,
            repliedOn: Int(entity.repliedOn),
            availability: entity.availability ?? "")
    }
}
