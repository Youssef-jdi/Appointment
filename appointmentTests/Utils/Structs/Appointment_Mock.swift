//
//  Appointment_Mock.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 27/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import Foundation

extension Appointment {
    static func mock() -> Appointment {
        let responseCount = ResponseCount(
            unknown: 0,
            unavailable: 0,
            available: 1,
            unsure: 0
        )

        let hasUser = AppointmentDateHasUser(
            userID: 1,
            userName: "Sam",
            lastName: "Tran",
            email: "huy@d-tt.nl",
            imageURL: nil,
            appointmentDateID: 123,
            comment: "I'm in hurry",
            repliedOn: 1,
            availability: "available"
        )


        let date = AppointmentDate(
            id: 1,
            appointmentId: 21,
            appointmentTitle: "interview",
            date: 123,
            appointmentLocation: "Somewhere",
            startTime: 123, endTime: 124,
            isFinal: nil,
            responseCount: responseCount,
            hasUsers: [hasUser]
        )

        return Appointment(
            id: 1,
            title: "An Appointment",
            description: "This is important",
            lastUpdate: 12,
            created: 20,
            creatorId: 1,
            creatorName: "Sam",
            type: "invite",
            category: "MEMO",
            longitude: 12,
            latitude: 12,
            address: "Sint Nicolaasstraat 9, 1012 NJ Amsterdam",
            dates: [date],
            participants: [],
            toDoList: [],
            attachments: [],
            availabilityAllowed: 1,
            dateProposalAllowed: 1,
            status: AppointmentStatus.created.rawValue,
            origin: AppointmentOrigin.defaultOrigin.rawValue,
            appointmentNotifyAt: 1,
            appointmentIsClosed: 2,
            chatIDS: ["abc"]
        )
    }
    
    static func mockCancelled() -> Appointment {
        let responseCount = ResponseCount(
            unknown: 0,
            unavailable: 0,
            available: 1,
            unsure: 0
        )

        let hasUser = AppointmentDateHasUser(
            userID: 1,
            userName: "Sam",
            lastName: "Tran",
            email: "huy@d-tt.nl",
            imageURL: nil,
            appointmentDateID: 123,
            comment: "I'm in hurry",
            repliedOn: 1,
            availability: "available"
        )


        let date = AppointmentDate(
            id: 1,
            appointmentId: 21,
            appointmentTitle: "interview",
            date: 123,
            appointmentLocation: "Somewhere",
            startTime: 123, endTime: 124,
            isFinal: nil,
            responseCount: responseCount,
            hasUsers: [hasUser]
        )

        return Appointment(
            id: 1,
            title: "An Appointment",
            description: "This is important",
            lastUpdate: 12,
            created: 20,
            creatorId: 1,
            creatorName: "Sam",
            type: "invite",
            category: "MEMO",
            longitude: 12,
            latitude: 12,
            address: "Sint Nicolaasstraat 9, 1012 NJ Amsterdam",
            dates: [date],
            participants: [],
            toDoList: [],
            attachments: [],
            availabilityAllowed: 1,
            dateProposalAllowed: 1,
            status: AppointmentStatus.cancelled.rawValue,
            origin: AppointmentOrigin.defaultOrigin.rawValue,
            appointmentNotifyAt: 1,
            appointmentIsClosed: 2,
            chatIDS: ["abc"]
        )
    }

    public static func == (lhs: Appointment, rhs: Appointment) -> Bool {
        return lhs.creatorId == rhs.creatorId && lhs.title == rhs.title && lhs.lastUpdate == rhs.lastUpdate
    }
}
