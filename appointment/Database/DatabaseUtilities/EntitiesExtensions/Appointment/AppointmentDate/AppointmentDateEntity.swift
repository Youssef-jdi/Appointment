//
//  AppointmentDateEntity.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

// swiftlint:disable force_cast
extension AppointmentDateEntity {

    static let entityName: String = "AppointmentDateEntity"

    var dateUserList: [ApppointmentDateUsersEntity?] {
        return self.dateUsers?.compactMap { $0 as? ApppointmentDateUsersEntity } ?? []
    }

    static func create(from appointmentDate: AppointmentDate, for context: NSManagedObjectContext) -> AppointmentDateEntity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        let newAppointmentDate = NSManagedObject(entity: entity, insertInto: context) as! AppointmentDateEntity

        updateObject(newAppointmentDate, from: appointmentDate)

        if let responseCount = appointmentDate.responseCount {
            let responseCountEntity = ResponseCountEntity.createNewResponseCount(from: responseCount, for: context)
            newAppointmentDate.responseCount = responseCountEntity
        }

        updateHasUsers(appointmentDate, newAppointmentDate)

        return newAppointmentDate
    }

    static func updateObject(_ newAppointmentDate: AppointmentDateEntity, from appointmentDate: AppointmentDate) {
        if let appointmentId = appointmentDate.appointmentId {
            newAppointmentDate.appointmentId = Int16(appointmentId)
        }

        if let id = appointmentDate.id {
            newAppointmentDate.id = Int16(id)
        }
        
        if let date = appointmentDate.date {
            newAppointmentDate.date = date
        }

        if let endTime = appointmentDate.endTime {
            newAppointmentDate.endTime = endTime
        }

        if let startTime = appointmentDate.startTime {
            newAppointmentDate.startTime = startTime
        }

        if let isFinal = appointmentDate.isFinal {
            newAppointmentDate.isFinal = Int16(isFinal)
        }

        newAppointmentDate.appointmentTitle = appointmentDate.appointmentTitle
        newAppointmentDate.location = appointmentDate.appointmentLocation
    }

      static func updateHasUsers(_ appointmentDate: AppointmentDate, _ newAppointmentDate: AppointmentDateEntity) {
          appointmentDate.hasUsers?.forEach { hasUser in
              let entity = ApppointmentDateUsersEntity.createNewDateUser(from: hasUser, for: newAppointmentDate.managedObjectContext!)
              newAppointmentDate.addToDateUsers(entity)
          }
      }
}
