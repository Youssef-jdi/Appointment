//
//  ParticipantEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 14/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension ParticipantEntity {

    static let entityName: String = "ParticipantEntity"

    static func createNewParticipant(from model: Participant, for context: NSManagedObjectContext) -> ParticipantEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newObject = NSManagedObject(entity: entity, insertInto: context) as! ParticipantEntity
        updateObject(newObject, from: model)
        return newObject
    }

    static func updateObject(_ newObject: ParticipantEntity, from model: Participant) {
        newObject.id = Int16(model.id)
        newObject.appointmentId = Int16(model.appointmentId)
        newObject.firstName = model.firstName
        newObject.lastName = model.lastName
        newObject.image = model.image
        newObject.status = model.status?.rawValue
        newObject.typeResponse = Int16(model.typeResponse)
        newObject.isViewed = Int16(model.isViewed)
    }
}
