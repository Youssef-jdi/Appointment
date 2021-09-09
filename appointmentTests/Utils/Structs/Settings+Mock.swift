//
//  Settings+Mock.swift
//  appointmentTests
//
//  Created by Youssef Jdidi on 6/11/20.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import Foundation

extension Settings: Equatable {
    static func mock() -> Settings {
        return .init(userID: "", pushAppointments: "dsq", pushInvites: "qsdqd", pushAgenda: "sqd", pushReminders: "dsq", status: "dsq", dateFormat: "sqd", pushFeedback: "dsq", pushBusiness: "dsqd", pushGroups: "dqs", language: "dsq", network: "dsq", timelineDisplay: "dsq", timeFormat: "dsq")
    }
}
