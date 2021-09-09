//
//  SettingsEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 02/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension SettingsEntity {

    static let entityName: String = "SettingsEntity"

    static func createSettings(from settings: Settings, for context: NSManagedObjectContext) -> SettingsEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        guard let newSettings = NSManagedObject(entity: entity, insertInto: context) as? SettingsEntity else {
            assertionFailure()
            return SettingsEntity()
        }

        updateObject(newSettings, from: settings)
        return newSettings
    }

    static func updateObject(_ settingEntity: SettingsEntity, from settings: Settings) {
        settingEntity.userId = settings.userID
        settingEntity.pushAgenda = settings.pushAgenda
        settingEntity.pushAppointments = settings.pushAppointments
        settingEntity.pushInvites = settings.pushInvites
        settingEntity.pushReminders = settings.pushReminders
        settingEntity.status = settings.status
        settingEntity.dateFormat = settings.dateFormat
        settingEntity.pushFeedback = settings.pushFeedback
        settingEntity.pushBusiness = settings.pushBusiness
        settingEntity.pushGroups = settings.pushGroups
        settingEntity.language = settings.language
        settingEntity.network = settings.network
        settingEntity.timelineDisplay = settings.timelineDisplay
        settingEntity.timeFormat = settings.timeFormat
    }
}

extension SettingsEntity {

    static func == (lhs: SettingsEntity, rhs: SettingsEntity) -> Bool {
        return lhs.userId == rhs.userId
    }

    static func == (lhs: SettingsEntity, rhs: Settings) -> Bool {
        return lhs.userId == rhs.userID
    }
}
