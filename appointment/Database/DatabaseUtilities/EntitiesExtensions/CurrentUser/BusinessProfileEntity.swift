//
//  BusinessProfileEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 12/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension BusinessProfileEntity {

    // MARK: class Name
    static let entityName: String = "BusinessProfileEntity"

    static func createNewBusinessProfile(from profile: BusinessProfile, for context: NSManagedObjectContext) -> BusinessProfileEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newBusinessProfile = NSManagedObject(entity: entity, insertInto: context) as! BusinessProfileEntity

        newBusinessProfile.function = profile.function
        newBusinessProfile.address = profile.address
        newBusinessProfile.kvk = profile.kvk
        newBusinessProfile.zipCodeCity = profile.zipCodeCity

        if let id = profile.userID {
            newBusinessProfile.userId = Int16(id)
        }

        return newBusinessProfile
    }
}
