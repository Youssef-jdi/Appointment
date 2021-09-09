//
//  InvitationResponse.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/25/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
import CoreLocation

struct Appointment: Codable {
    let id: Int
    let title: String
    let description: String?

    // TODO: clarify with Rick if time is in ms
    let lastUpdate: Int64 // unix time in ms
    let created: Int64 // unix time in ms
    let creatorId: Int
    let creatorName: String
    let type: String
    let category: String
    let longitude: Double
    let latitude: Double
    let address: String?
    var dates: [AppointmentDate]?
    let participants: [Participant]?
    let toDoList: [ToDo]?
    let attachments: [Attachment]?
    let availabilityAllowed: Int
    let dateProposalAllowed: Int
    let status: String?
    let origin: Int?
    let appointmentNotifyAt: Int64 // unix time in ms
    let appointmentIsClosed: Int
    let chatIDS: [String]

    enum CodingKeys: String, CodingKey {
        case id = "appointment_id"
        case title = "appointment_title"
        case description = "appointment_description"
        case lastUpdate = "appointment_last_updated"
        case creatorId = "appointment_creator_id"
        case category = "appointment_category"
        case type = "appointment_type"
        case longitude = "appointment_long"
        case latitude = "appointment_lat"
        case dates = "appointment_dates"
        case address = "appointment_location"
        case creatorName = "appointment_organiser"
        case participants = "appointment_participants"
        case toDoList = "appointment_todo_list_items"
        case created = "appointment_created_at"
        case attachments = "appointment_attachments"
        case availabilityAllowed = "appointment_availability_allowed"
        case dateProposalAllowed = "appointment_date_proposal_allowed"
        case status = "appointment_status"
        case origin = "appointment_origin"
        case appointmentNotifyAt = "appointment_notify_at"
        case appointmentIsClosed = "appointment_is_closed"
        case chatIDS = "chat_ids"
    }
}

// MARK: - Computed Properties
extension Appointment {
    /// Specifies the appointment's final date.
    var finalDate: AppointmentDate? {
        guard let dates = dates,
            !dates.isEmpty,
            let date = dates.first(where: { $0.isFinal == 1 })
            else { return nil }
        return date
    }
    
    // TODO: move to the view model
    // TODO: cleanup-1
    var formattedDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let original = Date(timeIntervalSince1970: TimeInterval(lastUpdate))
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: original)
    }

    // TODO: move to the view model
    // TODO: cleanup-1
    var createdAt: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let date = Date(timeIntervalSince1970: TimeInterval(created))
        return dateFormatter.string(from: date)
    }

    // TODO: move to the view model
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    var appointmentType: AppointmentType {
        guard let appType = AppointmentType(rawValue: type) else {
            assertionFailure("unknown case handled")
            return .unknown
        }

        return appType
    }

    var appointmentCategory: AppointmentCategory {
        guard let appCategory = AppointmentCategory(rawValue: category) else {
            assertionFailure("unknown case handled")
            return .unknown
        }

        return appCategory
    }

    var appointmentStatus: AppointmentStatus {
        guard let status = status, let appStatus = AppointmentStatus(rawValue: status) else {
            assertionFailure("unknown case handled")
            return .unknown
        }

        return appStatus
    }

    var appointmentOrigin: AppointmentOrigin {
        guard let origin = origin, let appOrigin = AppointmentOrigin(rawValue: origin) else {
            assertionFailure("unknown case handled")
            return .defaultOrigin
        }

        return appOrigin
    }
}

// MARK: Map from database entity
extension Appointment {

    static func map(from entity: AppointmentEntity) -> Appointment {
        return Appointment(
            id: Int(entity.id),
            title: entity.title ?? "",
            description: entity.description,
            lastUpdate: entity.lastUpdated,
            created: entity.created,
            creatorId: Int(entity.creatorId),
            creatorName: entity.creatorName ?? "",
            type: entity.type ?? "",
            category: entity.category ?? "unknown",
            longitude: entity.longitude,
            latitude: entity.latitude,
            address: entity.address,
            dates: entity.dateList.compactMap { AppointmentDate.map(from: $0) },
            participants: entity.participantList.compactMap { Participant.map(from: $0) },
            toDoList: entity.toDoList.compactMap { ToDo.map(from: $0) },
            attachments: entity.attachmentList.compactMap { Attachment.map(from: $0 ) },
            availabilityAllowed: Int(entity.availabilityAllowed),
            dateProposalAllowed: Int(entity.proposalAllowed),
            status: entity.status ?? "unknown",
            origin: Int(entity.origin),
            appointmentNotifyAt: entity.notifyAt,
            appointmentIsClosed: Int(entity.isClosed),
            chatIDS: entity.chatIds?.compactMap { $0 as? String } ?? []
        )
    }
}

extension Appointment: Equatable {

    static func == (lhs: Appointment, rhs: Appointment) -> Bool {
        return lhs.id == rhs.id
    }
}

struct CancelAppointmentResponse: Codable {}
