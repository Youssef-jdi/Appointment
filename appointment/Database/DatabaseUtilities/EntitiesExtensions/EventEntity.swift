//
//  EventEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension EventEntity {

    static let entityName: String = "EventEntity"

    // MARK: Request Types
    static var fetch: NSFetchRequest<NSManagedObject> {
        let request = NSFetchRequest<NSManagedObject>(entityName: entityName)
//        request.fetchLimit = 1 
        return request
    }

    static func createNewEvent(from event: AppEvent, for context: NSManagedObjectContext) -> EventEntity {
//        let newEvent = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! EventEntity
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        guard let newEvent = NSManagedObject(entity: entity, insertInto: context) as? EventEntity else {
            assertionFailure()
            return EventEntity()
        }
        updateObject(newEvent, from: event)

        return newEvent
    }

    static func updateObject(_ newEvent: EventEntity, from event: AppEvent) {
        newEvent.appointmentId = Int16(event.appointmentID)
        newEvent.dateTime = Int64(event.dateTime)
        newEvent.isRead = event.isRead
        newEvent.text = event.text
        newEvent.type = Int16(event.type)
        if let relation = event.relation?.rawValue {
            newEvent.relation = Int16(relation)
        }
    }
}

extension EventEntity {

    static func == (lhs: EventEntity, rhs: EventEntity) -> Bool {
        return lhs.appointmentId == rhs.appointmentId
            && lhs.dateTime == rhs.dateTime
    }

    static func == (lhs: EventEntity, rhs: AppEvent) -> Bool {
        return lhs.appointmentId == rhs.appointmentID
            && lhs.dateTime == rhs.dateTime
    }
}
