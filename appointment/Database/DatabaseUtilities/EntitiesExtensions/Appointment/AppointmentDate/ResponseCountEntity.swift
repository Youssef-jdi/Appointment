//
//  ResponseCountEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 14/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension ResponseCountEntity {

    static let entityName: String = "ResponseCountEntity"

    static func createNewResponseCount(from responseCount: ResponseCount, for context: NSManagedObjectContext) -> ResponseCountEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newResponseCount = NSManagedObject(entity: entity, insertInto: context) as! ResponseCountEntity
        updateObject(newResponseCount, from: responseCount)
        return newResponseCount
    }

    static func updateObject(_ newResponseCount: ResponseCountEntity, from responseCount: ResponseCount) {
        newResponseCount.available = Int16(responseCount.available)
        newResponseCount.unavailable = Int16(responseCount.unavailable)
        newResponseCount.unknown = Int16(responseCount.unknown)
        newResponseCount.unsure = Int16(responseCount.unsure)
    }
}
