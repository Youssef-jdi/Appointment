//
//  Settings.swift
//  appointment
//
//  Created by Raluca Mesterca on 02/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct Settings: Codable {
    let userID: String?
    let pushAppointments: String?
    let pushInvites: String?
    let pushAgenda: String?
    let pushReminders: String?
    let status: String?
    let dateFormat: String?
    let pushFeedback: String?
    let pushBusiness: String?
    let pushGroups: String?
    let language: String?
    let network: String?
    let timelineDisplay: String?
    let timeFormat: String?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case pushAppointments = "push_appointments"
        case pushInvites = "push_invites"
        case pushAgenda = "push_agenda"
        case pushReminders = "push_reminders"
        case status
        case dateFormat = "date_format"
        case pushFeedback = "push_feedback"
        case pushBusiness = "push_business"
        case pushGroups = "push_groups"
        case language, network
        case timelineDisplay = "timeline_display"
        case timeFormat = "time_format"
    }

    static var appLanguage: String {
        switch Locale.current.languageCode {
        case "nl": return "Dutch"
        case "en": return "English"
        default: return "Dutch"
        }
    }

    static func defaultSettings(
        userId: String? = nil,
        pushAppointments: String? = nil,
        pushInvites: String? = nil,
        pushAgenda: String? = nil,
        pushReminders: String? = nil,
        status: String? = nil,
        dateFormat: String? = nil,
        pushFeedback: String? = nil,
        pushBusiness: String? = nil,
        pushGroups: String? = nil,
        language: String,
        network: String? = nil,
        timelineDisplay: String? = nil,
        timeFormat: String? = nil
    ) -> Settings {

        return Settings(
            userID: userId,
            pushAppointments: pushAppointments,
            pushInvites: pushInvites,
            pushAgenda: pushAgenda,
            pushReminders: pushReminders,
            status: status,
            dateFormat: dateFormat,
            pushFeedback: pushFeedback,
            pushBusiness: pushBusiness,
            pushGroups: pushGroups,
            language: language,
            network: network,
            timelineDisplay: timelineDisplay,
            timeFormat: timeFormat
        )
    }
}

// MARK: Map from database entity
extension Settings {

    static func map(from entity: SettingsEntity) -> Settings {
        return Settings(
            userID: entity.userId,
            pushAppointments: entity.pushAppointments,
            pushInvites: entity.pushInvites,
            pushAgenda: entity.pushAgenda,
            pushReminders: entity.pushReminders,
            status: entity.status,
            dateFormat: entity.dateFormat,
            pushFeedback: entity.pushFeedback,
            pushBusiness: entity.pushBusiness,
            pushGroups: entity.pushGroups,
            language: entity.language,
            network: entity.network,
            timelineDisplay: entity.timelineDisplay,
            timeFormat: entity.timeFormat
        )
    }
}

extension Settings: Equatable {

    static func == (lhs: Settings, rhs: Settings) -> Bool {
        return lhs.userID == rhs.userID
    }
}
