//
//  ChatIdEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 14/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension ChatIdEntity {

    static let entityName: String = "ChatIdEntity"

    static func createNewChatId(from id: String, for context: NSManagedObjectContext) -> ChatIdEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newObject = NSManagedObject(entity: entity, insertInto: context) as! ChatIdEntity
        newObject.chatId = id
        return newObject
    }
}
