//
//  AddDate.swift
//  appointment
//
//  Created by Irina Filkovskaya on 16.06.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

/*
 Structures used to encode a request and decode the response
 for the API call adding a new suggested date to the appointment.
 */

import Foundation

struct AddDate: Codable, Equatable {
    let appointmentId: Int
    let suggestedDates: SuggestedDates
    
    enum CodingKeys: String, CodingKey {
        case appointmentId = "appointment_id"
        case suggestedDates = "suggested_dates"
    }
}
struct SuggestedDates: Codable, Equatable {
    let suggestedDate: SuggestedDate

    enum CodingKeys: String, CodingKey {
        case suggestedDate = "suggested_date"
    }
}

struct SuggestedDate: Codable, Equatable {
    let startTime: String
    let endTime: String
    let isFinal: String

    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case endTime = "end_time"
        case isFinal = "is_final"
    }
}

struct AppointmentDateResponse: Codable {
    let appointmentDates: [AddedAppointmentDate]

    enum CodingKeys: String, CodingKey {
        case appointmentDates = "appointment_dates"
    }
}

struct AddedAppointmentDate: Codable, Equatable {
    let id: String
    let appointmentId: String
    /// Unix time measured in milliseconds. Signifies the starts of the day of the AppointmentDate.
    /// Used to fetch all appointments planned for a particular day.
    let startTime: String
    let endTime: String
    let isFinal: String
    let hasUsers: [ResponseHasUsers]?
    enum CodingKeys: String, CodingKey {
        case id
        case appointmentId = "appointment_id"
        case startTime = "start_time"
        case endTime = "end_time"
        case isFinal = "is_final"
        case hasUsers = "appointment_date_has_users"
    }
}

struct ResponseHasUsers: Codable, Equatable {
    let userId: String
    let appointmentDateId: String
    let availability: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case appointmentDateId = "appointment_date_id"
        case availability = "availability"
    }
}

extension AddedAppointmentDate {
    func mapToAppointmentDate() -> AppointmentDate {
        return AppointmentDate(
            id: Int(self.id),
            appointmentId: Int(self.appointmentId),
            appointmentTitle: nil,
            date: nil,
            appointmentLocation: nil,
            startTime: Int64(self.startTime),
            endTime: Int64(self.endTime),
            isFinal: Int(self.isFinal),
            responseCount: nil,
            hasUsers: self.hasUsers?.map { $0.mapToHasUsers() }
        )
    }
}

extension ResponseHasUsers {
    func mapToHasUsers() -> AppointmentDateHasUser {
        return .init(
            userID: Int(self.userId) ?? 0,
            userName: "",
            lastName: "",
            email: "",
            imageURL: nil,
            appointmentDateID: Int(self.appointmentDateId) ?? 0,
            comment: nil,
            repliedOn: 0,
            availability: self.availability
        )
    }
}
