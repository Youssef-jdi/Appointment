//
//  AttachmentEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 14/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension AttachmentEntity {

    static let entityName: String = "AttachmentEntity"

    static func createNewAttachment(from model: Attachment, for context: NSManagedObjectContext) -> AttachmentEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newObject = NSManagedObject(entity: entity, insertInto: context) as! AttachmentEntity
        updateObject(newObject, from: model)
        return newObject
    }

    static func updateObject(_ newObject: AttachmentEntity, from model: Attachment) {
        newObject.id = model.id
        newObject.path = model.path
    }
}
