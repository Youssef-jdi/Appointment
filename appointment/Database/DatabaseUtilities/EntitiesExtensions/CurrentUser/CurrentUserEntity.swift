//
//  CurrentUserEntity.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/16/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension CurrentUserEntity {

    // MARK: class Name
    static let entityName: String = "CurrentUserEntity"

    // swiftlint:disable force_cast
    static func createNewUser(from userProfile: UserProfile, for context: NSManagedObjectContext) -> CurrentUserEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newUser = NSManagedObject(entity: entity, insertInto: context) as! CurrentUserEntity
        updateObject(newUser, from: userProfile)

        if let businessProfile = userProfile.businessProfile {
            let businessProfileEntity = BusinessProfileEntity.createNewBusinessProfile(from: businessProfile, for: context)
            newUser.businessProfile = businessProfileEntity
        }
        return newUser
    }

    static func updateObject(_ newUser: CurrentUserEntity, from profile: UserProfile) {
        newUser.userId = Int16(profile.userId)
        newUser.firstName = profile.firstName
        newUser.lastName = profile.lastName
        newUser.email = profile.email
        newUser.imageUrl = profile.image
        newUser.password = profile.password

        if let credits = profile.credits {
            newUser.credits = Int16(credits)
        }

        if let isRegistered = profile.isRegistered {
            newUser.isRegistered = Int16(isRegistered)
        }

        if let isBanned = profile.isBanned {
            newUser.isBanned = Int16(isBanned)
        }

        newUser.createdAt = profile.createdAt
        newUser.registeredAt = profile.registeredAt
        newUser.updatedAt = profile.updatedAt
    }
}
