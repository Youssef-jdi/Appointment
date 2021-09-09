//
//  AppointmentDate.swift
//  appointment
//
//  Created by Raluca Mesterca on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

// Naming is terrible, but keeping API convention
struct AppointmentDate: Codable, Equatable {
    let id: Int?
    let appointmentId: Int?
    let appointmentTitle: String?
    /// Unix time measured in milliseconds. Signifies the starts of the day of the AppointmentDate.
    /// Used to fetch all appointments planned for a particular day.
    let date: Int64? //
    let appointmentLocation: String?
    // TODO: 12/06/2020 - clarify with Rick V. if time is in ms or not
    let startTime: Int64?
    let endTime: Int64?

    let isFinal: Int?
    let responseCount: ResponseCount?
    let hasUsers: [AppointmentDateHasUser]?

     enum CodingKeys: String, CodingKey {
        case id = "id"
        case appointmentId = "appointment_id"
        case appointmentTitle = "appointment_title"
        case appointmentLocation = "appointment_location"
        case startTime = "start_time"
        case endTime = "end_time"
        case isFinal = "is_final"
        case responseCount = "response_count"
        case hasUsers = "appointment_date_has_users"
        case date = "date"
    }

    var startDate: Date? {
        guard let startTime = startTime else { assertionFailure(); return nil }
        return Date(timeIntervalSince1970: TimeInterval(startTime) / 1000)

        // TODO: 12/06/2020 - clarify with Rick V. if time is in ms or not
//        return startTime?.dateFromMilliseconds()
    }

    var endDate: Date? {
        guard let endTime = endTime else { assertionFailure(); return nil }
        return Date(timeIntervalSinceNow: TimeInterval(endTime) / 1000)
    }
}

struct AppointmentDateViewModel {
    var date: String
    var start: String
    var end: String
    var respondedTo: Bool
    var unknown: String
    var unavailable: String
    var available: String
    var availableInt: Int
    var unsure: String
    /// - Percentage is a float describing the rate of available person for the invitation
    /// - It is a float between 0 and 1 to display on the UISlider
    var percentage: Float
}

// MARK: - Map from database entity
extension AppointmentDate {

    static func map(from entity: AppointmentDateEntity?) -> AppointmentDate? {
        guard let entity = entity else { return nil }
        return AppointmentDate(
            id: Int(entity.id),
            appointmentId: Int(entity.appointmentId),
            appointmentTitle: entity.appointmentTitle,
            date: entity.date,
            appointmentLocation: entity.location,
            startTime: entity.startTime,
            endTime: entity.endTime,
            isFinal: Int(entity.isFinal),
            responseCount: ResponseCount.map(from: entity.responseCount),
            hasUsers: entity.dateUserList.compactMap { AppointmentDateHasUser.map(from: $0) })
    }
}

extension AppointmentDate: Hashable {
    func hash(into hasher: inout Hasher) {}
}
