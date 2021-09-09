//
//  AppointmentEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

extension AppointmentEntity {

    static let entityName: String = "AppointmentEntity"

    var attachmentList: [AttachmentEntity?] {
        return self.attachments?.compactMap { $0 as? AttachmentEntity } ?? []
    }

    var dateList: [AppointmentDateEntity?] {
        return self.dates?.compactMap { $0 as? AppointmentDateEntity } ?? []
    }

    var chatIdList: [ChatIdEntity?] {
        return self.chatIds?.compactMap { $0 as? ChatIdEntity } ?? []
    }

    var participantList: [ParticipantEntity?] {
        return self.participants?.compactMap { $0 as? ParticipantEntity } ?? []
    }

    var toDoList: [ToDoListEntity?] {
         return self.toDoListItems?.compactMap { $0 as? ToDoListEntity } ?? []
     }

    static func createNewAppointment(from appointment: Appointment, for context: NSManagedObjectContext) -> AppointmentEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newAppointment = NSManagedObject(entity: entity, insertInto: context) as! AppointmentEntity

        updateObject(newAppointment, from: appointment)
        addAttachments(newAppointment, from: appointment)
        addChatIds(newAppointment, from: appointment)
        addDates(newAppointment, from: appointment)
        addParticipants(newAppointment, from: appointment)
        addToDoItems(newAppointment, from: appointment)

        return newAppointment
    }

    static func updateObject(_ newAppointment: AppointmentEntity, from appointment: Appointment) {
        newAppointment.address = appointment.address
        newAppointment.appointmentDescription = appointment.description
        newAppointment.availabilityAllowed = Int16(appointment.availabilityAllowed)
        newAppointment.category = appointment.category
        newAppointment.created = appointment.created
        newAppointment.creatorId = Int16(appointment.creatorId)
        newAppointment.creatorName = appointment.creatorName
        newAppointment.id = Int16(appointment.id)
        newAppointment.isClosed = Int16(appointment.appointmentIsClosed)
        newAppointment.lastUpdated = appointment.lastUpdate
        newAppointment.latitude = appointment.longitude
        newAppointment.longitude = appointment.longitude
        newAppointment.notifyAt = appointment.appointmentNotifyAt
        
        if let origin = appointment.origin {
            newAppointment.origin = Int16(origin)
        }
        newAppointment.status = appointment.status
        newAppointment.title = appointment.title
        newAppointment.type = appointment.type
    }

    static func addDates(_ newAppointment: AppointmentEntity, from appointment: Appointment) {
        if let dates = appointment.dates {
            dates.forEach { date in
                let newDate = AppointmentDateEntity.create(from: date, for: newAppointment.managedObjectContext!)
                newAppointment.addToDates(newDate)
            }
        }
    }

    static func addAttachments(_ newAppointment: AppointmentEntity, from appointment: Appointment) {
        if let attachments = appointment.attachments {
            attachments.forEach { attachment in
                let object = AttachmentEntity.createNewAttachment(from: attachment, for: newAppointment.managedObjectContext!)
                newAppointment.addToAttachments(object)
            }
        }
    }

    static func addChatIds(_ newAppointment: AppointmentEntity, from appointment: Appointment) {
        appointment.chatIDS.forEach { id in
            let object = ChatIdEntity.createNewChatId(from: id, for: newAppointment.managedObjectContext!)
            newAppointment.addToChatIds(object)
        }
    }

    static func addParticipants(_ newAppointment: AppointmentEntity, from appointment: Appointment) {
        if let participants = appointment.participants {
            participants.forEach { participant in
                let object = ParticipantEntity.createNewParticipant(from: participant, for: newAppointment.managedObjectContext!)
                newAppointment.addToParticipants(object)
            }
        }
    }

    static func addToDoItems(_ newAppointment: AppointmentEntity, from appointment: Appointment) {
        if let toDoList = appointment.toDoList {
            toDoList.forEach { item in
                let object = ToDoListEntity.createNewToDo(from: item, for: newAppointment.managedObjectContext!)
                newAppointment.addToToDoListItems(object)
            }
        }
    }
}
