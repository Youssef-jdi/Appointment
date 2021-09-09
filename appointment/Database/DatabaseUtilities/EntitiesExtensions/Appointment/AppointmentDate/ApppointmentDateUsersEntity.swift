//
//  ApppointmentDateUsersEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 14/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension ApppointmentDateUsersEntity {

    static let entityName: String = "ApppointmentDateUsersEntity"

    static func createNewDateUser(from model: AppointmentDateHasUser, for context: NSManagedObjectContext) -> ApppointmentDateUsersEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newObject = NSManagedObject(entity: entity, insertInto: context) as! ApppointmentDateUsersEntity
        updateObject(newObject, from: model)
        return newObject
    }

    static func updateObject(_ newObject: ApppointmentDateUsersEntity, from model: AppointmentDateHasUser) {
        newObject.availability = model.availability
        newObject.appointmentDateID = Int16(model.appointmentDateID)
//        newObject.repliedOn = Int16(model.repliedOn)
        newObject.comment = model.comment
        newObject.imageURL = model.imageURL
        newObject.email = model.email
        newObject.lastName = model.lastName
        newObject.username = model.userName
        newObject.userId = Int16(model.userID)
    }
}
