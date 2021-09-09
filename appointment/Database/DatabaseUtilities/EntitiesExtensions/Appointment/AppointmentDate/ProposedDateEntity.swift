//
//  ProposedDateEntity.swift
//  appointment
//
//  Created by Jihen on 02/07/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

// swiftlint:disable force_cast
extension ProposedDateEntity {

    static let entityName: String = "ProposedDateEntity"

    static func createProposedDate(from model: AppointmentProposedDate, for context: NSManagedObjectContext) -> ProposedDateEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newObject = NSManagedObject(entity: entity, insertInto: context) as! ProposedDateEntity
        updateProposedDates(newObject, from: model)
        return newObject
    }

    static func updateProposedDates(_ newObject: ProposedDateEntity, from model: AppointmentProposedDate) {
        newObject.id = Int16(model.id)
        newObject.appointmentId = Int16(model.appointmentId)
        newObject.creatorId = Int16(model.creatorId)
        newObject.start = Int64(model.start)
        newObject.end = Int64(model.end)
        newObject.isApproved = Int16(model.isApproved)
    }
}
