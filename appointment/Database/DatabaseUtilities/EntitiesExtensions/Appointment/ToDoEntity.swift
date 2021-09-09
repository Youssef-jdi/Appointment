//
//  ToDoEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 14/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension ToDoListEntity {

    static let entityName: String = "ToDoListEntity"

    static func createNewToDo(from model: ToDo, for context: NSManagedObjectContext) -> ToDoListEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newObject = NSManagedObject(entity: entity, insertInto: context) as! ToDoListEntity
        updateObject(newObject, from: model)
        return newObject
    }

    static func updateObject(_ newObject: ToDoListEntity, from model: ToDo) {
        if let appointmentId = model.appointmentId {
            newObject.appointmentId = Int16(appointmentId)
        }

        if let id = model.id {
            newObject.id = Int16(id)
        }

        newObject.itemDescription = model.description
        newObject.completed = Int16(model.completed)
    }
}
