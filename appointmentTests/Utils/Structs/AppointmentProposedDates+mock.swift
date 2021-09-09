//
//  AppointmentProposedDates+mock.swift
//  appointmentTests
//
//  Created by Jihen on 02/07/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import Foundation

extension AppointmentProposedDate {
    static func mock() -> [AppointmentProposedDate] {
        return [AppointmentProposedDate(id: 2,
                                        appointmentId: 2,
                                        creatorId: 2,
                                        start: 1555613300,
                                        end: 1566613266,
                                        isApproved: 1),
                AppointmentProposedDate(id: 2,
                                        appointmentId: 2,
                                        creatorId: 2,
                                        start: 1555613300,
                                        end: 1566613266,
                                        isApproved: 1),
                AppointmentProposedDate(id: 2,
                                        appointmentId: 2,
                                        creatorId: 2,
                                        start: 1555613300,
                                        end: 1566613266,
                                        isApproved: 0),
                AppointmentProposedDate(id: 2,
                                        appointmentId: 2,
                                        creatorId: 2,
                                        start: 1555613300,
                                        end: 1566613266,
                                        isApproved: 0)]
    }
}

