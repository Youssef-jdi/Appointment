//
//  GoogleCalendarResponse.swift
//  appointment
//
//  Created by Rachel Polachova on 12/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct GoogleCalendarResposne: Decodable {
    let items: [GoogleItems]
}

struct GoogleItems: Decodable {
    let accessRole: String
    let id: String
    let kind: String
    let summary: String
    let conferenceProperties: ConferenceProperties
    let defaultReminders: [DefaultReminder]
    let notificationSettings: NotificationSettings?
    let hidden, selected: Bool?
    let primary, deleted: Bool?
    let location, timeZone, summaryOverride, colorID: String?
}

struct GoogleCalendarItems: Codable {
    let kind, id, summary: String
    let gmailContactsResponseDescription: String?
    let location, timeZone, summaryOverride, colorID: String?
    let backgroundColor, foregroundColor: String?
    let hidden, selected: Bool?
    let accessRole: String
    let defaultReminders: [DefaultReminder]
    let notificationSettings: NotificationSettings
    let primary, deleted: Bool?
    let conferenceProperties: ConferenceProperties

    enum CodingKeys: String, CodingKey {
        case kind, id, summary
        case gmailContactsResponseDescription = "description"
        case location, timeZone, summaryOverride
        case colorID = "colorId"
        case backgroundColor, foregroundColor, hidden, selected, accessRole, defaultReminders, notificationSettings, primary, deleted, conferenceProperties
    }
}

// MARK: - ConferenceProperties
struct ConferenceProperties: Codable {
    let allowedConferenceSolutionTypes: [String]
}

// MARK: - DefaultReminder
struct DefaultReminder: Codable {
    let method: String
    let minutes: Int
}

// MARK: - NotificationSettings
struct NotificationSettings: Codable {
    let notifications: [Notification]
}

// MARK: - Notification
struct Notification: Codable {
    let type, method: String
}

//struct GoogleCalendarResponse: Decodable {
//    let items: [String]
//
//    struct GoogleCalendarItem: Decodable {
//        let id: String
//        let kind: String
//        let summary: String
//        let location: String
//        let timeZone: String
//        let summaryOverride: String
//        let hidden: Bool
//        let selected: Bool
//        let accessRole: String
//        let defaultReminders: [GoogleDefaultReminders]
//        let notificationSettings: GoogleNotifications
//        let primary: Bool
//        let deleted: Bool
//        let conferenceProperties: GoogleConferecneProperties
//    }
//
//    struct GoogleDefaultReminders: Decodable {
//        let method: String
//        let minutes: String
//    }
//
//    struct GoogleNotificationSettings: Decodable {
//        let type: String
//        let method: String
//    }
//
//    struct GoogleNotifications: Decodable {
//        let notifications: [GoogleNotificationSettings]
//    }
//
//    struct GoogleConferecneProperties: Decodable {
//        let allowedConferenceSolutionTypes: [String]
//    }
//}
